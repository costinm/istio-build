#!/usr/bin/env bash

# Set environment variables and functions for istio provisioning

# Script requires/assume kubectl and gcloud tools are installed and configured/authenticated.
export PROJECT=${PROJECT:-costin-istio}

# Project service account, will be added to the VM
# TODO: generate a brand new service account for the VM
export ACCOUNT=${ACCOUNT:-291514510799-compute@developer.gserviceaccount.com}

export ISTIO_REGION=${ISTIO_REGION:-us-central1}
export ISTIO_ZONE=${ISTIO_ZONE:-us-central1-a}

export NET=default

export ISTIO_RAWVM=${ISTIO_RAWVM:-debtest}

function istioGCECreate() {
# TODO: use metadata=startup-script or startup-script-url to auto-configure
   IMAGE=${1:-debian-9-stretch-v20170717}

   # --image ubuntu-1604-xenial-v20170307
   # --image-project ubuntu-os-cloud

  gcloud compute --project $PROJECT instances create $ISTIO_RAWVM --zone $ISTIO_ZONE \
   --machine-type "n1-standard-1" \
   --subnet $NET \
   --can-ip-forward \
   --service-account $ACCOUNT \
   --scopes "https://www.googleapis.com/auth/cloud-platform" \
   --tags "http-server","https-server" \
   --image $IMAGE \
   --image-project "debian-cloud" \
   --boot-disk-size "10" \
   --boot-disk-type "pd-standard" \
   --boot-disk-device-name "debtest"

   # Optional: --private-network-ip ?
   # --metadata startup-script='#! /bin/bash
   #apt-get update
   # apt-get install -y socat
   #EOF'

   # 24h, cheaper
   #--preemptible  --maintenance-policy "TERMINATE"\

}

function istioGCEDelete() {
  gcloud compute -q --project $PROJECT instances delete $ISTIO_RAWVM --zone $ISTIO_ZONE
}

function istioGCEInit() {
  gcloud config set compute/region $ISTIO_REGION
  gcloud config set compute/zone $ISTIO_ZONE
}

# Not supported: gcloud compute networks create istio-net --mode custom
#gcloud compute networks subnets create kubernetes \
#  --network istio-net --range 10.240.0.0/24 --region $ISTIO_REGION

# Firewall:
#
# gcloud compute firewall-rules list --filter "network=default"
# gcloud compute firewall-rules create allow-external \
#  --allow tcp:22,tcp:3389,tcp:6443,icmp --network default --source-ranges 0.0.0.0/0




function istioGCESetFirewall() {
  gcloud compute --project=$PROJECT firewall-rules create default-allow-http --network=$NET \
   --allow=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

  gcloud compute --project=$PROJECT firewall-rules create default-allow-https --network=$NET \
   --allow=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server

  gcloud beta compute --project=costin-istio \
    firewall-rules create kubedns \
    --direction=INGRESS --priority=1000 --network=default --allow=udp:53 --source-ranges=0.0.0.0/0
}


function istioGCEExternalIP() {
  gcloud compute --project $PROJECT instances describe $ISTIO_RAWVM --format='value(networkInterfaces[0].accessConfigs[0].natIP)'

  # For 'reserved' addresses
  # gcloud compute addresses create istio-external --region=$ISTIO_REGION
  # gcloud compute address list
  # gcloud compute addresses describe $ISTIO_RAWVM --region $ISTIO_REGION  --format 'value(address)'
}




# Alternative using kubedns endpoint address (may change)
function getDns() {
  DNS=$(kubectl get endpoints  -n kube-system kube-dns -o jsonpath='{.subsets[0].addresses[0].ip}')
  echo "server=/default.svc.cluster.local/$DNS"

  # get -w will get and watch = could be scripted to update and restart dnsmasq
}


# Expose a service running on the VM.
# Params:
# - port of the service
# - service name (default to raw vm name)
# - IP of the rawvm (will get it from gcloud if not set)
#
function istioExposeRawVM() {
  PORT=${1:-8080}
  NAME=${2:-$ISTIO_RAW}
  ISTIO_RAWVM_INTERNAL_IP=${3:-$(gcloud compute --project $PROJECT instances describe $ISTIO_RAWVM --format='value(networkInterfaces[0].networkIP)')}
  # The 'name: http' is critical - without it the service is exposed as TCP

  cat << EOF | kubectl apply -f -
kind: Service
apiVersion: v1
metadata:
  name: $NAME
spec:
  ports:
    - protocol: TCP
      port: $PORT
      name: http

---

kind: Endpoints
apiVersion: v1
metadata:
  name: $ISTIO_RAW$PORT
subsets:
  - addresses:
      - ip: $ISTIO_RAWVM_INTERNAL_IP
    ports:
      - port: $PORT
EOF
}

function getCert() {
  local ACT=${1:-istio.istio-mixer-service-account}
  kubectl get secret $ACT -o jsonpath='{.data.cert-chain\.pem}' |base64 -d  > cert-chain.pem
  kubectl get secret $ACT -o jsonpath='{.data.cert-chain\.pem}' |base64 -d  > cert-chain.pem
  kubectl get secret $ACT -o jsonpath='{.data.cert-chain\.pem}' |base64 -d  > cert-chain.pem
  # | openssl x509 -text

}

function pilotDebug() {
 PILOT=localhost:8080


 # LDS - Listeners - each listener defines a cluster name and a route name
 #  GET /v1/listeners/(string: service_cluster)/(string: service_node)
 curl -v http://${PILOT}/v1/listeners/istio-proxy/cluster.local | head -n -1 > envoy-static.json

 # RDS - Routes - For each route - route names use the port number as name
 # GET /v1/routes/(string: route_config_name)/(string: service_cluster)/(string: service_node)
 curl -v http://localhost:8080/v1/routes/80/istio-proxy/sidecar~127.0.0.1~.~cluster.local >> envoy-static.json

 # CDS - clusters - should have 'in' clusters based on matching the node
 # GET /v1/clusters/(string: service_cluster)/(string: service_node)
 curl -v 'http://${PILOT}/v1/clusters/istio-proxy/10.20.1.9|hello-3564253481-dvc07.default|cluster.local'

 # SDS - service endpoints. Service name extracted from the cluster.
 #  GET /v1/registration/(string: service_name)
 curl -v 'http://${PILOT}/v1/registration/istio-mixer.default.svc.cluster.local|tcp' >endpoints.mixer.json
}

# Create a config that can be deployed into the raw VM, to allow auth with minimal RBAC access
# In progress - needs ca.pem
function istioCreateK8SConfig() {
   CLUSTER=${1:-istio}


  kubectl config set-cluster $CLUSTER \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=bootstrap.kubeconfig

  kubectl config set-credentials kubelet-bootstrap \
    --token=${BOOTSTRAP_TOKEN} \
    --kubeconfig=bootstrap.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=kubelet-bootstrap \
    --kubeconfig=bootstrap.kubeconfig

  kubectl config use-context default --kubeconfig=bootstrap.kubeconfig

}

# cfssl required on admin machine
# https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/
function initClearIPTables() {
  $SSH -c "iptables -t nat -F; iptables  -t nat -X ISTIO_REDIRECT; iptables  -t nat -X ISTIO_OUTPUT"
}

function initSetIPTables() {
  # TODO: how to find the service CIDR range automatically ?
  $SSH -c "/usr/local/bin/prepare_proxy.sh -p 15001 -u 0 -i 10.23.0.0/16"

}


# Create a service account, with the same name as the VM
function istioCreateServiceAccount() {
  kubectl create serviceaccount $ISTIO_RAWVM
  SECRET=$(kubectl get serviceaccount $ISTIO_RAWVM -o jsonpath='{.secrets[0].name}')

  # Base64-encoded JWT token, signed with the CA, Example: {"alg":"RS256","typ":"JWT"}
  # {"iss":"kubernetes/serviceaccount",
  # "kubernetes.io/serviceaccount/namespace":"default",
  # "kubernetes.io/serviceaccount/secret.name":"debtest4-token-g8g7j",
  # "kubernetes.io/serviceaccount/service-account.name":"debtest4",
  # "kubernetes.io/serviceaccount/service-account.uid":"f258ae9b-7baa-11e7-86d1-42010a80005b",
  # "sub":"system:serviceaccount:default:debtest4"}
  kubectl get secret  $SECRET -o jsonpath='{.data.token}'

  # In k8s, this is /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
  kubectl get secret  $SECRET -o jsonpath="{.data['ca\.crt']}"
}


# Creates server-key.pem and server.crt, signed with the K8S root CA
function istioCreateServiceCert() {
  # TODO: add the IP of the raw VM

  # create server.csr and server-key.pem in current directory
  # In K8S, the common name of the subject is used as the user name for the request
  cat <<EOF | cfssl genkey - | cfssljson -bare server
{
  "hosts": [
    "$ISTIO_RAWVM.default.svc.cluster.local",
    "$ISTIO_RAWVM.default.pod.cluster.local"
  ],
  "CN": "$ISTIO_RAWMV.default.pod.cluster.local",
  "key": {
    "algo": "ecdsa",
    "size": 256
  }
}
EOF

  cat <<EOF | kubectl create -f -
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: $ISTIO_RAWVM.default
spec:
  groups:
  - system:authenticated
  request: $(cat server.csr | base64 | tr -d '\n')
  usages:
  - digital signature
  - key encipherment
  - server auth
EOF
  kubectl certificate approve $ISTIO_RAWVM.default

  kubectl get csr $ISTIO_RAWVM.default -o jsonpath='{.status.certificate}'  | base64 -d > server.crt

  cfssl certinfo -cert server.crt

}


# Copy a local .deb file to the VM, add few utilities
function istioSetupSidecar() {
 $SSH "apt-get update; apt-get install dnsutils dnsmasq tcpdump netcat"
 $SSH --command "rm -f istio-debian.deb"
 $SCP bazel-bin/istio-debian.deb  debtest:
 $SSH --command "sudo dpkg -i istio-debian.deb"
}


SCP="gcloud compute scp --project $PROJECT --zone $ISTIO_ZONE"
SSH="gcloud compute ssh --project $PROJECT --zone $ISTIO_ZONE $ISTIO_RAWVM"


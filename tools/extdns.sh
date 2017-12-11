#!/usr/bin/env bash

# Experimenting with external DNS to setup the test env.

function build() {
  export GOPATH=/workspace/extdns
  mkdir -p $GOPATH
  cd $GOPATH
  go get -u github.com/kubernetes-incubator/external-dns
}

function testService() {
  kubectl run nginx --image=nginx --replicas=1 --port=80
  kubectl expose deployment nginx --port=80 --target-port=80 --type=LoadBalancer
  kubectl annotate service nginx "external-dns.alpha.kubernetes.io/hostname=nginx.istio.webinf.info."
}

function createZone() {
  gcloud config set project costin-istio
  gcloud dns record-sets list --zone istiotest

  # Create cluster with DNS write permissions ( if running dns controller in k8s)
  gcloud container clusters create "external-dns" \
    --num-nodes 1 \
    --scopes "https://www.googleapis.com/auth/ndev.clouddns.readwrite"

  gcloud dns managed-zones create "external-dns-test" \
    --dns-name "t1.istio.webinf.info." \
    --description "External dns"

}

# --source=service - for all annotated services, find the state and Ingress IP, create A
#  svc.Status.LoadBalancer.Ingress

# --source=ingress - for each 'ingress' resource, if annotated create A records


#cat ~/.config/gcloud/application_default_credentials.json
./bin/external-dns --debug  --once   --dry-run \
  --provider=google --google-project=costin-istio \
  --source=service --source=ingress \
  --domain-filter=istio.webinf.info --fqdn-template {{.Name}}.istio.webinf.info \

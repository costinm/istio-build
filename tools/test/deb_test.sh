#!/usr/bin/env bash

# Script requires/assume kubectl and gcloud tools are installed and configured/authenticated.
export PROJECT=${PROJECT:-costin-istio}

# Project service account, will be added to the VM
# TODO: generate a brand new service account for the VM
export ACCOUNT=${ACCOUNT:-291514510799-compute@developer.gserviceaccount.com}

export ZONE=${ZONE:-us-central1-a}
export NET=default

export TESTVM=${TESTVM:-debtest}

function start() {
# TODO: use metadata=startup-script or startup-script-url to auto-configure
   # 24h, cheaper
   #--preemptible  --maintenance-policy "TERMINATE"\

  gcloud compute --project $PROJECT instances create $TESTVM --zone $ZONE \
   --machine-type "n1-standard-1" \
   --subnet $NET \
   --can-ip-forward \
   --service-account $ACCOUNT \
   --scopes "https://www.googleapis.com/auth/cloud-platform" \
   --tags "http-server","https-server" \
   --image "debian-9-stretch-v20170717" \
   --image-project "debian-cloud" \
   --boot-disk-size "10" \
   --boot-disk-type "pd-standard" \
   --boot-disk-device-name "debtest"
}

function getDns() {

  DNS=$(kubectl get endpoints  -n kube-system kube-dns -o jsonpath='{.subsets[0].addresses[0].ip}')
  echo "server=/default.svc.cluster.local/$DNS"

}

function setFirewall() {
  gcloud compute --project=$PROJECT firewall-rules create default-allow-http --network=$NET \
   --allow=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

  gcloud compute --project=$PROJECT firewall-rules create default-allow-https --network=$NET \
   --allow=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server

  gcloud beta compute --project=costin-istio \
    firewall-rules create kubedns \
    --direction=INGRESS --priority=1000 --network=default --allow=udp:53 --source-ranges=0.0.0.0/0

}

function stop() {
  gcloud compute -q --project $PROJECT instances delete $TESTVM --zone $ZONE

}

function externalIP() {
  gcloud compute --project $PROJECT instances describe $TESTVM --format='value(networkInterfaces[0].accessConfigs[0].natIP)'
}

function provision() {
  $SSH "apt-get update; apt-get install dnsutils dnsmasq"

}

function initK8SPilot() {
  echo "Creating K8S service account for pilot"

}

function initClearIPTables() {
  $SSH -c "iptables -t nat -F; iptables  -t nat -X ISTIO_REDIRECT; iptables  -t nat -X ISTIO_OUTPUT"
}

function initSetIPTables() {
  # TODO: how to find the service CIDR range automatically ?
  $SSH -c "/usr/local/bin/prepare_proxy.sh -p 15001 -u 0 -i 10.23.0.0/16"

}

CMD=$1

SCP="gcloud compute scp --project $PROJECT --zone $ZONE"
SSH="gcloud compute ssh --project $PROJECT --zone $ZONE debtest"

if [ "$CMD" = "start" ] ; then
  start
elif [ "$CMD" = "init" ] ; then

  $SSH --command "rm -f istio-debian.deb"
  $SCP bazel-bin/istio-debian.deb  debtest:
  $SSH --command "sudo dpkg -i istio-debian.deb"

elif [ "$CMD" = "stop" ] ; then
  stop

elif [ "$CMD" = "ssh" ] ; then
  shift
  IP=`externalIP`
  echo ssh $IP
  $SSH $*
  #ssh $IP
else

  echo "start init stop ssh"

fi

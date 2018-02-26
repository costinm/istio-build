#!/usr/bin/env bash
# Setup and document common environment variables used for building and testing Istio
# User-specific settings can be added to .istiorc in the project workspace or $HOME/.istiorc
# This may include dockerhub settings or other customizations.

# Source the file with: ". envsetup.sh"

export TOP=$(cd ../../..; pwd)
export GO_TOP=$TOP
# Used in the shell scripts.
export ISTIO_SRC=$TOP
export GOPATH=$TOP
export ISTIO_GO=$GOPATH/src/istio.io/istio

export ISTIO_OUT=$GO_TOP/out/linux_amd64/release

export PATH=$GOPATH/bin:$ISTIO_OUT:$PATH

# hub used to push images.
export HUB=${ISTIO_HUB:-grc.io/istio-testing}
export TAG=${ISTIO_TAG:-$USER}

# Artifacts and temporary files.
export OUT=${GOPATH}/out

export ISTIO_OUT=${OUT}/linux_amd64/release

if [ -f .istiorc ] ; then
  source .istiorc
fi

if [ -f $HOME/.istiorc ] ; then
  source $HOME/.istiorc
fi


# Runs make at the top of the tree.
function m() {
    (cd $TOP; make $*)
}

# Image used by the circleci, including all tools
export DOCKER_BUILDER=${DOCKER_BUILDER:-istio/ci:go1.10-k8s1.9}

# Runs the Istio docker builder image, using the current workspace and user id.
function dbuild() {
  docker run --rm -u $(id -u) -it \
	  --volume /var/run/docker.sock:/var/run/docker.sock \
    -v $TOP:$TOP -w $TOP \
    -e GID=$(id -g) \
    -e USER=$USER \
    -e HOME=$TOP \
    --entrypoint /bin/bash \
    $DOCKER_BUILDER \
    -c "$*"
}

alias kwatch="kubectl get events --all-namespaces -w"
alias kall="kubectl get all --all-namespaces -o wide"
alias kpo="kubectl get po --all-namespaces -o wide"

# Kubernetes forward port by label. Will use the same port as the app.
function kfwd() {
    local port=$1
    local label=$2
    local ns=${3:-istio-system}
    kubectl --namespace=$ns port-forward $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') $port:$port
}

function klog() {
    local label=$1
    local container=${2:-istio-proxy}
    local ns=${3:-istio-system}
    echo kubectl --namespace=$ns log $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') $container
    kubectl --namespace=$ns log $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') $container $4
}

# List the IPs at docker level, from a node.
# In minikube this is the pod range, like 172.17.0.x
# Also minikube seems to use 192.168.99.1 for the host, .100 for the VM
alias dockerips="docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /'"

function kexec() {
    local label=$1
    local container=${2:-istio-proxy}
    local ns=${3:-istio-system}
    kubectl --namespace=$ns exec -it $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') -c $container /bin/bash
}

function kfwd-pilot() {
    kubectl --namespace=istio-system port-forward $(kubectl --namespace=istio-system get -l istio=pilot pod -o=jsonpath='{.items[0].metadata.name}') 15003:8080
}

function klog-pilot() {
    klog istio=pilot discovery istio-system $*
}

function kexec-pilot() {
    kexec istio=pilot
}

alias istiocurl="curl -k --cert /etc/certs/cert-chain.pem --cacert /etc/certs/root-cert.pem --key /etc/certs/key.pem  "

# Lunch a specific environment, by sourcing files specific to the env or using gcloud.
#
# This allows a developer to work with multiple clusters and environments, without
# overriding or changing his main ~/.kube/config
#
# For each env, create a file under $HOME/.istio/ENV_NAME
#
# By default, the env is the name of a gcloud project, followed by zone (defaults to us-west1-c).
# A third argument (default to istio-test) indicates the GKE cluster to use.
#
# Will set TEST_ENV and KUBECONFIG environment variables.
#
# Predefined:
# - minikube: will start a regular minikube in a VM
#
function lunch() {
    local env=$1

    if [ "$env" == "local" ]; then
    	export KUBECONFIG=${ISTIO_GO}/.circleci/config
	    $ISTIO_GO/bin/testEnvLocalK8S.sh start

        export ISTIO=127.0.0.1
    elif [ "$env" == "minikube" ]; then
        export KUBECONFIG=${OUT}/minikube.conf
        minikube status | grep Running
        if [ "$?" != "0" ]  || [ ! -f ${KUBECONFIG} ] ; then
          minikube start --memory 16384 --cpus 4 --kubernetes-version v1.9.0 \
            --apiserver-name apiserver.minikube.istio.webinf.info
        fi
	    minikube update-context
	    eval $(minikube docker-env)

	    export ISTIO=$(minikube ip)

    elif [[ -f $HOME/.istio/${env} ]]; then
        source $HOME/.istio/${env}

        export ISTIO=$(kubectl get -n istio-system service istio-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    else
        local zone=${2:-us-west1-c}
        local cluster=${3:-istio-test}
        export KUBECONFIG=$HOME/.istio/k8s.$env.yaml
        gcloud container clusters get-credentials $cluster --zone $zone --project $project

        export ISTIO=$(kubectl get -n istio-system service istio-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    fi

    export TEST_ENV=$env

    echo "Enabled $env with KUBECONFIG=$KUBECONFIG and IP=$ISTIO"
}

function stop() {
    local env=$1
    if [ "$env" == "minikube" ]; then
        minikube stop
    fi
}

# Deploy or update istio.
# To see generated config and apply custom configs:
#    kubeapply=less istioDeploy install/kubernetes/istio-helm/scale.yaml
function istioDeploy() {
     local v=${1:-install/kubernetes/values-istiotest.yaml}
     kubectl create ns istio-system >/dev/null  2>&1

     local apply=${kubeapply:-kubectl apply -f -}
     echo Deploy istio with $TAG and $HUB $ISTIO_IP:30080
#     (cd install/kubernetes/istio-helm ; istioctl gen-deploy -o yaml --values $v ) | kubectl apply -f -
     helm template --values $v \
       --set ingressNodePort=30080 \
       --set istioTag=$TAG \
       --set istioHub=$HUB \
       install/kubernetes | $apply
}

# Deploy istio test apps.
function istioDeployTest() {
     local v=${1:-}

     local apply=${kubeapply:-kubectl apply -n istio-test -f -}

     kubectl create ns istio-test
     helm template tests/helm --set testHub=$HUB --set testTag=$TAG   --set istioTag=$TAG \
       --set istioHub=$HUB \
           $v | istioctl \
        kube-inject --debug --meshConfigMapName=istio --hub $HUB --tag $TAG -f - | $apply
}

# Run e2e test on deployed cluster.
#  bookinfo. mixer, simple, pilot
function istioE2E() {
    local t=${1:-simple}

    go test -v -timeout 20m ./tests/e2e/tests/${t} -args \
      --skip_setup --namespace istio-test \
      --mixer_tag ${TAG} --pilot_tag ${TAG} --proxy_tag ${TAG} --ca_tag ${TAG} \
      --mixer_hub ${HUB} --pilot_hub ${HUB} --proxy_hub ${HUB} --ca_hub ${HUB} \
      --istioctl $ISTIO_OUT/istioctl

}

function istioTestPilot() {
    local t=${1:-}
    mkdir -p $OUT/logs

    if [ "$t" != "" ] ; then
        t="--testtype $t"
    fi

    ISTIO_SKIP_SYSTEM=1 go run ./pilot/test/integration/*.go --skip-cleanup \
        -mixer=true -auth=disable \
        -hub $HUB -tag $TAG \
        -n istio-test -ns istio-system -logs=false \
        $t -errorlogsdir ${OUT}/logs

    # http-reachability
    # tcp-reachablility
}

# Also docker rm $(docker ps -a -q)
alias istioDockerCleanImages='docker rmi $(docker images -q)'

# Switch to a new deb branch
function istioBranch() {
    local b=$1
    git status -b -s --untracked-files=no
    git checkout github/master
    git pull github/master
    git checkout -b $1
}

function istioSync() {
    git fetch github
    git fetch origin
    git pull github master
}

function pilot-stats() {
    curl -v http://$ZVPN:15003/cache_stats
}

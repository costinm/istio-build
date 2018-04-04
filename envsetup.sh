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
export OUT_DIR=$TOP/out
export ISTIO_OUT=$GO_TOP/out/linux_amd64/release

export PATH=$GOPATH/bin:$ISTIO_OUT:$PATH

# hub used to push images.
export HUB=${ISTIO_HUB:-grc.io/istio-testing}
export TAG=${ISTIO_TAG:-$USER}

export LOG_DIR=${TOP}/out/logs
mkdir -p $LOG_DIR

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
function ingress-exec() {
    local ns=${1:-istio-system}
    kubectl --namespace=$ns exec -it $(kubectl --namespace=$ns get -l istio=ingress pod -o=jsonpath='{.items[0].metadata.name}') -c ingress /bin/bash
}

function pilot-get() {
    curl localhost:15003/cache_stats
}

# Access to istio-system components
function pilot-logs() {
    klog istio=pilot discovery istio-system $*
}
function ingress-logs() {
    klog istio=ingress ingress istio-system $*
}

function pilot-exec() {
    kexec istio=pilot istio-proxy istio-system
}
function istio-exec-system-pilot() {
    kexec istio=pilot istio-proxy istio-system
}
function istio-logs-system-pilot() {
    klog istio=pilot discovery istio-system $*
}
function istio-exec-system-ingress() {
    kexec istio=ingress ingress istio-system
}
function istio-logs-system-ingress() {
    klog istio=ingress ingress istio-system $*
}
function istio-logs-system-mixer() {
    klog istio=mixer mixer istio-system $*
}
function istio-logs-system-mixer-proxy() {
    klog istio=mixer mixer-proxy istio-system $*
}
function istio-exec-system-simple() {
    kexec app=echosrv echosrv istio-system
}
function istio-logs-system-simple() {
    klog app=echosrv echosrv istio-system $*
}
function istio-exec-system-simple-proxy() {
    kexec app=echosrv istio-proxy istio-system
}
function istio-logs-system-simple-proxy() {
    klog app=echosrv istio-proxy istio-system $*
}
function istio-fwd-system-pilotmon() {
    istio-fwd1 istio=pilot istio-system 11093 9093
}
function istio-fwd-system-pilot() {
    istio-fwd1 istio=pilot istio-system 11080 8080
}


# Access to pilot no-auth suite
function istio-exec-noauth-a() {
   kexec app=a istio-proxy pilot-noauth
}
function istio-logs-noauth-a() {
    klog app=a istio-proxy pilot-noauth $*
}
function istio-exec-noauth-b() {
   kexec app=b istio-proxy pilot-noauth
}
function istio-exec-noauth-ingress() {
   kexec app=ingress istio-proxy pilot-noauth-system
}
function istio-exec-noauth-pilot() {
   kexec infra=pilot istio-proxy pilot-noauth-system
}
function istio-logs-noauth-mixer-proxy() {
    klog istio=mixer istio-proxy pilot-noauth-system $*
}
function istio-logs-noauth-ingress() {
    klog app=ingress istio-proxy pilot-noauth-system $*
}
function istio-logs-noauth-pilot() {
    klog infra=pilot discovery pilot-noauth-system $*
}
function istio-fwd-noauth-pilotmon() {
    istio-fwd1 infra=pilot pilot-noauth-system 12093 9093
}
function istio-fwd-noauth-pilot() {
    istio-fwd1 infra=pilot pilot-noauth-system 12080 8080
}

# Access to istio-test
# Access to pilot no-auth suite
function istio-exec-test-a() {
   kexec app=a istio-proxy istio-test
}
function istio-logs-test-a() {
    klog app=a istio-proxy istio-test $*
}
function istio-exec-test-b() {
   kexec app=b istio-proxy istio-test
}

function make-bootstrap() {
 cp $TOP/out/linux_amd64/release/bootstrap/all/envoy-rev0.json pkg/bootstrap/testdata/all_golden.json
 cp $TOP/out/linux_amd64/release/bootstrap/auth/envoy-rev0.json pkg/bootstrap/testdata/auth_golden.json
 cp $TOP/out/linux_amd64/release/bootstrap/default/envoy-rev0.json pkg/bootstrap/testdata/default_golden.json
}


function istio-fwd1() {
    local L=$1
    local NS=$2
    local PL=$3
    local PR=$4

    local N=$NS-$L
    if [[ -f $LOG_DIR/fwd-$N.pid ]] ; then
        kill -9 $(cat $LOG_DIR/fwd-$N.pid)
    fi
    kubectl --namespace=$NS port-forward $(kubectl --namespace=$NS get -l $L pod -o=jsonpath='{.items[0].metadata.name}') $PL:$PR &
    echo $! > $LOG_DIR/fwd-$N.pid
}


# Access to the pilot auth suite
function test-exec-auth-pilot() {
   kexec infra=pilot istio-proxy pilot-auth-system
}
function test-fwd-auth-pilot() {
   kfwd 15005 infra=pilot pilot-auth-system
}
function test-fwd-auth-pilot1() {
   kfwd2 8080 15003 infra=pilot pilot-auth-system
}


function istio-fwd() {
    fwd-prom
    fwd-grafana
    fwd-servicegraph
    pilot-fwd
}

# Kubernetes forward port by label. Will use the same port as the app.
function kfwd() {
    local port=$1
    local label=$2
    local ns=${3:-istio-system}
    kubectl --namespace=$ns port-forward $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') $port:$port
}
function kfwd2() {
    local port=$1
    local port2=$2
    local label=$3
    local ns=${4:-istio-system}
    kubectl --namespace=$ns port-forward $(kubectl --namespace=$ns get -l $label pod -o=jsonpath='{.items[0].metadata.name}') $port:$port2
}

function istioV2() {
   local T=${1-$TAG}
    docker tag ${HUB}/proxyv2:$T ${HUB}/proxy:$T
    docker tag ${HUB}/proxyv2:$T ${HUB}/proxy_debug:$T
}

function istioV2Push() {
   local T=${1-$TAG}
    docker push ${HUB}/proxyv2:$T
    docker push ${HUB}/proxy:$T
    docker push ${HUB}/proxy_debug:$T
}

function fwdApp() {
    local N=$1
    local P=$2

    if [[ -f $LOG_DIR/fwd-$N.pid ]] ; then
        kill -9 $(cat $LOG_DIR/fwd-$N.pid)
    fi

    echo "$N http://localhost:$P"
    kubectl --namespace=istio-system port-forward $(kubectl --namespace=istio-system get -l app=$N pod -o=jsonpath='{.items[0].metadata.name}') $P:$P &
    echo $! > $LOG_DIR/fwd-$N.pid
}

function pilot-fwd() {
    local N=pilot

    if [[ -f $LOG_DIR/fwd-$N.pid ]] ; then
        kill -9 $(cat $LOG_DIR/fwd-$N.pid)
    fi

    local POD=$(kubectl get -n istio-system po  |grep pilot |grep Running | cut -f1 -d\ )
    echo "Pilot http://localhost:15003/cache_stats $POD"
    #kubectl --namespace=istio-system port-forward $(kubectl --namespace=istio-system get -l istio=pilot pod -o=jsonpath='{.items[0].metadata.name}') 15003:8080
    kubectl --namespace=istio-system port-forward $POD 15003:8080
}

function istio-key() {

    go run ./security/cmd/generate_cert/main.go \
        -signer-priv ./security/samples/plugin_ca_certs/ca-key.pem \
        -signer-cert ./security/samples/plugin_ca_certs/ca-cert.pem \
        -client -host spiffe://costin.foo.com

}
function port-registry() {

  POD=$(kubectl get pods --namespace kube-system -l k8s-app=kube-registry \
  -o template --template '{{range .items}}{{.metadata.name}} {{.status.phase}}{{"\n"}}{{end}}' \
  | grep Running | head -1 | cut -f1 -d' ')
    if [[ -f $LOG_DIR/registry.pid ]] ; then
        kill -9 $(cat $LOG_DIR/registry.pid)
    fi
  kubectl port-forward --namespace kube-system $POD 5000:5000 &
    echo $! > $LOG_DIR/registry.pid
}

function pilot-fwdmon() {
    local N=pilotmon

    if [[ -f $LOG_DIR/fwd-$N.pid ]] ; then
        kill -9 $(cat $LOG_DIR/fwd-$N.pid)
    fi
    kubectl --namespace=istio-system port-forward $(kubectl --namespace=istio-system get -l istio=pilot pod -o=jsonpath='{.items[0].metadata.name}') 19093:9093 &
    echo $! > $LOG_DIR/fwd-$N.pid
}

function fwd-prom() {
    fwdApp prometheus 9090
}

function fwd-grafana() {
    fwdApp grafana 3000
}

function fwd-servicegraph() {
    fwdApp servicegraph 8088
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
    if [ "$env" != "minikube" ]; then
        unset DOCKER_BUILDER
        unset DOCKER_CERT_PATH
        unset DOCKER_TLS_VERIFY
        unset DOCKER_HOST
        unset DOCKER_API_VERSION
    fi

    if [ "$env" == "local" ]; then
    	export KUBECONFIG=${ISTIO_GO}/.circleci/config
	    $ISTIO_GO/bin/testEnvLocalK8S.sh start

        export ISTIO=127.0.0.1
    elif [ "$env" == "minikube" ]; then
        export KUBECONFIG=${OUT}/minikube.conf
        minikube status | grep Running
        if [ "$?" != "0" ]  || [ ! -f ${KUBECONFIG} ] ; then
          minikube start --memory 8192 --cpus 2 --kubernetes-version v1.9.0 \
            --apiserver-name apiserver.minikube.istio.webinf.info
          kubectl apply -f tests/util/localregistry/localregistry.yaml
        fi
	    minikube update-context
	    eval $(minikube docker-env)
        #export HUB=localhost:5000
        #export TAG=latest

	    export ISTIO=$(minikube ip)

        port-registry

    elif [[ -f $HOME/.istio/${env} ]]; then
        source $HOME/.istio/${env}
        export KUBECONFIG=$HOME/.istio/k8s.$env.yaml

        export ISTIO=$(kubectl get -n istio-system service istio-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    else
        echo "lunch local|minikube|..."
        echo ls $HOME/.istio

        echo "Env file must contain ZONE CLUSTER PROJECT"
        echo "and: gcloud container clusters get-credentials $CLUSTER --zone $ZONE --project $PROJECT"
        return
    fi

    export TEST_ENV=$env
    local CC=$(kubectl current-context)
    kubectl config set contexts.default-context.namespace istio-system
    echo "Enabled $env with KUBECONFIG=$KUBECONFIG and IP=$ISTIO"
}

function kconf() {
 kubectl config set-credentials user --username=$1 --password=$2
 kubectl config set-cluster local-server --server=http://localhost:8080
 kubectl config set-context default-context --cluster=local-server --user=user
 kubectl config use-context default-context
 kubectl config set contexts.default-context.namespace istio-system
 kubectl config view
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
     local v=${1:-install/kubernetes/helm/istio/values-istiotest.yaml}
     kubectl create ns istio-system >/dev/null  2>&1

     local apply=${kubeapply:-kubectl apply -n istio-system -f -}
     echo Deploy istio with $TAG and $HUB $ISTIO_IP:30080
#     (cd install/kubernetes/istio-helm ; istioctl gen-deploy -o yaml --values $v ) | kubectl apply -f -
     helm template --namespace istio-system --values $v \
       --set global.tag=$TAG \
       --set global.hub=$HUB \
       install/kubernetes/helm/istio | $apply
}

function istioDeployDefault() {
     local v=${1:-install/kubernetes/helm/istio/values-istiotest.yaml}
     kubectl create ns istio-system >/dev/null  2>&1
     helm template --namespace istio-system --values $v \
          install/kubernetes/helm/istio | kubectl apply -n istio-system -f -
}

# Deploy istio test apps.
function istioDeployTest() {
     local v=${1:-}

     local apply=${kubeapply:-kubectl apply -n istio-test -f -}

     kubectl create ns istio-test
     export ISTIO_PROXY_IMAGE=proxyv2
     helm template tests/helm --namespace istio-test --set istioHub=$HUB --set testHub=$HUB --set testEnv=`date +%H%M` --set testTag=$TAG $v | istioctl \
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

function pilot-m() {
    make pilot docker.pilot push.docker.pilot
    istioDeploy
    pilot-fwd
}

# Get pprof for pilot. Assumes 15003 is forwarded
function pilot-pprof() {

    if [[ -f $LOG_DIR/pprof.pid ]] ; then
        kill -9 $(cat $LOG_DIR/pprof.pid)
    fi

    #go tool pprof -web -sample_index inuse_space  http://$ZVPN:15003/debug/pprof/heap
    go tool pprof -web -sample_index alloc_space  http://$ZVPN:15003/debug/pprof/heap

    go tool pprof -http=:9999 -alloc_space -seconds 20 http://$ZVPN:15003/debug/pprof/heap  &
    echo $! > $LOG_DIR/pprof.pid
    sleep 4000

    #go tool pprof -http=:9998 -alloc_space -seconds 20 http://$ZVPN:15003/debug/pprof/heap  &

}

function cpToMk() {
	docker save $1 | (eval $(minikube docker-env) && docker load)
}

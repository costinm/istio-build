
# Run '. build/envsetup.sh' first. Will set environment variables
# and functions used for the build and test env.

export TOP=`pwd`
export ISTIO_SRC=$TOP
export GOPATH=$ISTIO_SRC/go
export ISTIO_GO=$GOPATH/src/istio.io/istio

echo "Setting istio source $TOP, GOPATH=$GOPATH"

# Runs make at the top of the tree.
function m() {
    (cd $TOP; make $*)
}

export DOCKER_BUILDER=${DOCKER_BUILDER:-gcr.io/istio-testing/istio-builder:latest}

# Runs the Istio docker builder image, using the current workspace and user id.
function dbuild() {

  docker run --rm -u $(id -u) -it \
	  --volume /var/run/docker.sock:/var/run/docker.sock \
    -v $TOP:$TOP -w $TOP \
    -e GID=$(id -g) \
    -e USER=$USER \
    -e HOME=$TOP \
    $DOCKER_BUILDER \
    -c $*

}

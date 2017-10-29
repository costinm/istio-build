
# Run '. build/envsetup.sh' first. Will set environment variables
# and functions used for the build and test env.

export TOP=`pwd`
export ISTIO_SRC=$TOP


# Runs make at the top of the tree.
function m() {
    (cd $TOP; make $*)
}


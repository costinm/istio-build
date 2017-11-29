#!/bin/bash

REPO=${REPO:-http://github.com/costinm/istio-repo}

# Download the source files.
function init_repo() {
    if [ ! -f .repo ]; then
      repo init -u $REPO $*
    fi

}



set -x

init_repo $*

repo sync -c


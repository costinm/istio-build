#!/usr/bin/env bash

# Initialize istio depot. Will download istio sources in current dir.
TOP=${TOP:-`pwd`}

# Download the source files.
function init_repo() {
    if [ ! -f $TOP/bin/repo ]; then
      mkdir -p bin
      curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo
      chmod a+x bin/repo
    fi

    if [ ! -f .repo ]; then
      $TOP/bin/repo init -u http://github.com/costinm/istio-repo $*
    fi

    $TOP/bin/repo sync -c
}



init_repo $*
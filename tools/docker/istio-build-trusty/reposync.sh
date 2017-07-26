#!/usr/bin/env bash

ISTIO_SRC=${ISTIO_SRC:/workspace}

if [ -f $ISTIO_SRC/.repo/repo/repo ] ; then
  REPO=$ISTIO_SRC/.repo/repo/repo
else
  mkdir -p /workspace/bin
  curl https://storage.googleapis.com/git-repo-downloads/repo > /workspace/bin/repo
  chmod +x /workspace/bin/repo
  REPO=/workspace/bin/repo
fi

# TODO: params/env to customize branch
cd $ISTIO_SRC
$REPO init -u https://github.com/costinm/istio-repo
$REPO sync -c
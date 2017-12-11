#!/usr/bin/env bash

# Small shell script to run a transient docker build step, as current user
# using the current directory mounted as "WS" (may be set as /workspace or
# /home/circleci).

IMG=$1
shift
CMD=$*

WS=${WS-/workspace}

cd $TOP
docker run --rm -u $(id -u) -it \
     -v $PWD:$WS -w $WS -e USER=$USER \
     $IMG \
     /bin/bash -c "$CMD"

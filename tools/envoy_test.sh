#!/bin/bash
#
# Copyright 2017 Istio Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# Run as root, in a docker image with privs enabled. May also be run on a normal machine with sudo -
# make sure to clear afterwards.

ISTIO_BIN_BASE=${ISTIO_BIN_BASE:-/usr/local/bin}

OUT=${OUT:=/ws/proxy/test.logs}
mkdir -p $OUT

# Prevent loading of the default sidecar config
export ISTIO_SIDECAR_CONFIG=/tmp/missing

# For testing, override the command (running inside the container, to not mess with host iptables):
#  CMD="bash -x /ws/proxy/tools/deb/istio-iptables.sh" bash -x ./iptables_tests.sh  2>&1
DEF_CMD="${ISTIO_BIN_BASE}/istio-start.sh"
CMD=${CMD:-$DEF_CMD}


HOSTIP=$(/sbin/ip route|awk '/default/ { print $3 }')

$CMD &
ENVOY_PROCESS=$(ps ax |grep envoy)
echo "Envoy: $ENVOY_PROCESS"

# Start a simple http service on 9999
busybox http -p 9999
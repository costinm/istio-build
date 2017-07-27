#!/usr/bin/env bash

set -e

action="$1"
oldversion="$2"

umask 022

if ! getent passwd istio >/dev/null; then
    addgroup --system istio
    adduser --system istio -g istio --home /var/lib/istio
fi

if [ ! -e /etc/istio ]; then
   # Backward compat.
   ln -s /var/lib/istio /etc/istio
fi

mkdir -p /var/lib/istio/envoy
mkdir -p /var/lib/istio/config
chown istio.istio /var/lib/istio/envoy /var/lib/istio/config


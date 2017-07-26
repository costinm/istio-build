#!/usr/bin/env bash

set -e

action="$1"
oldversion="$2"

umask 022

if ! getent passwd istio >/dev/null; then
    addgroup --system istio
    adduser --system istio --home /var/lib/istio --uid
    adduser istio istio
fi



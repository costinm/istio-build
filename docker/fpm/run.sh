#!/usr/bin/env bash

# Environment variables control the execution
fpm --version

# fpm -s dir /workspace/bazel-out/img=/
# -t deb|rpm

# Required: NAME

if [-z $NAME]; then
    echo "Required env:"
    echo "  NAME - name of the package"
    exit 1
fi

fpm -s dir -t deb -n $NAME \
  --config-files /etc/redis/redis.conf \
  -v 2.6.10 \
  src/redis-server=/usr/bin/ redis.conf=/etc/redis/
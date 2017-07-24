#!/bin/bash

# Script to sync generated artifacts, following golang style of checking in
# generated files. Both golang and cc generated files will be synced.
# Uses the bazel build output.

bazel build @googleapis//:http_api_protos
cp -a -f bazel-out/local-fastbuild/genfiles/external/googleapis/google genfiles/

bazel build @envoy//source/common/ratelimit/...
cp -a -f bazel-out/local-fastbuild/genfiles/external/envoy/source genfiles/
cp -a -f bazel-out/local-fastbuild/genfiles/external/envoy/source/common genfiles/

cp -a -f bazel-out/local-fastbuild/genfiles/external/envoy_api/api/ genfiles/

cp -a -f bazel-out/local-fastbuild/genfiles/src/istio.io/api/mixer genfiles/

cp -a -f bazel-out/local-fastbuild/genfiles/external/proxy/src genfiles/

mkdir -p genfiles/src/lightstep/lightstep-tracer-common
cp -a -f bazel-out/local-fastbuild/genfiles/src/lightstep/lightstep-tracer-common/* genfiles/src/lightstep/lightstep-tracer-common
cp -a -f bazel-out/local-fastbuild/genfiles/src/lightstep/lightstep-tracer-common/* genfiles/src/lightstep/lightstep-tracer-common

# Go genfiles
rm -rf go/src/vendor/istio.io/*
cp -a -f bazel-out/local-fastbuild/genfiles/external/io_istio_api/api go/src/vendor/istio.io
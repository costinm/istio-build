#!/bin/bash

# Script to sync generated artifacts, following golang style of checking in
# generated files. Both golang and cc generated files will be synced.
# Uses the bazel build output.

# Proxy dependencies (cc/.h)
bazel build @googleapis//:http_api_protos
cp -a -f bazel-genfiles/external/googleapis/google genfiles/

bazel build @envoy//source/common/ratelimit/...
cp -a -f bazel-genfiles/external/envoy/source genfiles/
cp -a -f bazel-genfiles/external/envoy/source/common genfiles/
cp -a -f bazel-genfiles/external/envoy_api/api/ genfiles/

mkdir -p genfiles/src/lightstep/lightstep-tracer-common
cp -a -f bazel-genfiles/src/lightstep/lightstep-tracer-common/* genfiles/src/lightstep/lightstep-tracer-common
cp -a -f bazel-genfiles/src/lightstep/lightstep-tracer-common/* genfiles/src/lightstep/lightstep-tracer-common


cp -a -f bazel-genfiles/external/io_istio_api/mixer genfiles/

cp -a -f bazel-genfiles/external/proxy/src genfiles/


cp -a -f bazel-genfiles/external/proxy/src genfiles

# Go genfiles
rm -rf go/src/vendor/istio.io/*
rm -rf go/src/vendor/github.com/googleapis/googleapis

mkdir -p go/src/vendor/istio.io/api
cp -a -f bazel-genfiles/external/io_istio_api/proxy go/src/vendor/istio.io/api

cp -a -f bazel-genfiles/external/io_istio_api/mixer go/src/vendor/istio.io
#cp -a -f bazel-out/local-fastbuild/genfiles/external/io_istio_api/api go/src/vendor/istio.io
mkdir -p go/src/vendor/istio.io/mixer
mkdir -p go/src/vendor/istio.io/api

#cp -a -f bazel-genfiles/external/mixer/* go/src/vendor/istio.io/mixer
cp -a -f bazel-genfiles/external/io_istio_api/* go/src/vendor/istio.io/api

#mkdir -p go/src/vendor/github.com/googleapis/googleapis
#cp -a -f bazel-genfiles/external/com_github_googleapis_googleapis/* go/src/vendor/github.com/googleapis/googleapis/

#mkdir -p go/src/vendor/istio.io/mixer/pkg/config/proto
# Exception: the package can't be split between vendor and src, so this file must be in source tree,
# or code refactored to be alone in a package. In general protos should be in separate prackages.
#cp bazel-genfiles/external/com_github_istio_api/fixed_cfg.pb.go go/src/istio.io/mixer/pkg/config/proto


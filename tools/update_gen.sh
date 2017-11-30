#!/usr/bin/env bash

# Script to build istio proxy, using a repo manifest to manage git dependencies.
# All deps will be pulled from head (or the branch specified in the manifest).

WS=${ISTIO_SRC:-`pwd`}
PROXY=src/proxy
DEPS=./src


# Populate the pre-generated files - using the canonical bazel build.
function genUpdate() {
    local GEN=$WS/genfiles
    local BAZEL_GEN=bazel-genfiles

    mkdir -p $GEN/bazel
    cp -a -f $BAZEL_GEN/* $GEN/bazel

    # Bazel picks the file from non-standard location.
    mkdir -p $GEN/common/filesystem
    cp -f src/envoy/source/common/filesystem/inotify/watcher_impl.h $GEN/common/filesystem

    # Built during envoy_deps, but not included in bazel (deleted after autoconf/build)
    if [ -d $PROXY/bazel-out/host/bin/external/ ] ; then
        PROTOC=$PROXY/bazel-out/host/bin/external/com_google_protobuf/protoc
    else
        PROTOC=bazel-out/host/bin/external/com_google_protobuf/protoc
    fi
    $PROTOC  --proto_path=$DEPS/lightstep-tracer-common/:$DEPS/protobuf/src --cpp_out=$GEN $DEPS/lightstep-tracer-common/lightstep_carrier.proto
    $PROTOC  --proto_path=$DEPS/lightstep-tracer-common/:$DEPS/protobuf/src --cpp_out=$GEN $DEPS/lightstep-tracer-common/collector.proto

    # Manually generated:
    # cares/ - autoconf, extracted from grpc repo which uses same mechanism
    # nghttp2ver.h - manually generated
}

genUpdate

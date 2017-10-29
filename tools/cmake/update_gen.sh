#!/usr/bin/env bash

# Script to build istio proxy, using a repo manifest to manage git dependencies.
# All deps will be pulled from head (or the branch specified in the manifest).

WS=${PROXY_SRC:-`pwd`}
PROXY=.
DEPS=./vendor


# Populate the pre-generated files - using the canonical bazle build.
# In future this can be generated directly with protoc.
function genUpdate() {
    local GEN=$PROXY/genfiles
    local BAZEL_GEN=$PROXY/bazel-genfiles

    mkdir -p $GEN/mixer
    cp -a -f $BAZEL_GEN/external/mixerapi_git/mixer/v1 $GEN/mixer

    cp -a -f $BAZEL_GEN/external/gogoproto_git/gogoproto $GEN

    cp -a -f $BAZEL_GEN/external/googleapis_git/google/rpc/ $GEN/google/

    cp -a -f $BAZEL_GEN/external/envoy_api/api  $GEN

    mkdir -p $GEN/src/envoy
    cp -a -f  $BAZEL_GEN/src/envoy/mixer  $GEN/src/envoy

    cp -a -f  $BAZEL_GEN/external/googleapis/google/api  /ws/istio-master/genfiles/google
    mkdir -p $GEN/common/filesystem/
    cp -f $WS/envoy/source/common/filesystem/inotify/watcher_impl.h $GEN/common/filesystem/

    mkdir -p $GEN/source/common
    cp -a -f  $BAZEL_GEN/external/envoy/source/common/ratelimit $GEN/source/common

    cp $PROXY/bazel-proxy/external/envoy_deps/thirdparty_build/include/lightstep_carrier.pb.h $GEN/
    cp $PROXY/bazel-proxy/external/envoy_deps/thirdparty_build/include/collector.pb.h $GEN/

    cp -f $BAZEL_GEN/external/mixerclient_git/src/global_dictionary.cc $GEN/

    cp -a -f $BAZEL_GEN/external/envoy/source/common $GEN

    cp -a -f $BAZEL_GEN/external/googleapis/google $GEN


    PROTOC=$PROXY/bazel-out/host/bin/external/com_google_protobuf/protoc
    $PROTOC  --proto_path=$DEPS/lightstep/lightstep-tracer-common/:$DEPS/protobuf/src --cpp_out=$GEN $DEPS/lightstep/lightstep-tracer-common/lightstep_carrier.proto
    $PROTOC  --proto_path=$DEPS/lightstep/lightstep-tracer-common/:$DEPS/protobuf/src --cpp_out=$GEN $DEPS/lightstep/lightstep-tracer-common/collector.proto

    # Manually generated:
    # cares/ - autoconf, see also grpc
    # nghttp2ver.h
}

if [[ ${1:-} == "gen" ]] ; then
  genUpdate
fi

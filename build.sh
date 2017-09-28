#!/usr/bin/env bash

WS=${WS:-$GOPATH/..}
ISTIO=${ISTIO_IO:-${WS}/go/src/istio.io}

ANDROID_SDK=${ANDROID_SDK:-/a/opt/Android/Sdk}
ANDROID_NDK=${ANDROID_NDK:-$ANDROID_SDK/ndk-bundle}

ACMAKE=${CMAKE:-/opt/clion-stable/bin/cmake/bin/cmake}

function buildPi() {
    if [ -n prebuilts/linux-x86/pi ]; then
        mkdir -p prebuilts/linux-x86/pi
        (cd prebuilts/linux-x86/pi; git clone https://github.com/raspberrypi/tools)
    fi
    mkdir cmake-pi-debug
    pushd cmake-pi-debug
    cmake -DCMAKE_TOOLCHAIN_FILE=../pi.cmake ..
    make envoy
    popd
}

function buildAndroid() {
    # Trusty cmake is 2.8, not supported by event and android
    # Can use either android or clion static versions

    # ANDROD_STL=c++_static - error: type 'std::string' (aka 'basic_string<char, char_traits<char>, allocator<char> >') does not provide a subscript operator
    #    void toLowerCase(std::string& string) const { toLowerCase(&string[0], string.size()); }

    # stlport_static:
    #  error: no member named 'move' in namespace 'std'

    # gnustl_static:  error: no member named 'to_string' in namespace 'std' (mixerclient)

    ACMAKE=$ANDROID_SDK/cmake/3.6.3155560/bin/cmake
    mkdir -p cmake-android-debug
    (mkdir cmake-android-debug; cd cmake-android-debug; $ACMAKE   -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=clang -DANDROID_PLATFORM=android-26 -DANDROID_NDK=$ANDROID_NDK  -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake ..; make envoy)

}

function buildAlpine() {

    docker run -it --rm -v $WS:/workspace alpine sh -c /workspace/tools/build_alpine.sh
}

function genUpdate() {

    cp -a -f $ISTIO/proxy/bazel-genfiles/external/mixerapi_git/mixer/v1 $WS/genfiles/mixer/v1

    #rm -rf $WS/genfiles/src/lightstep/lightstep-tracer-common
    #cp -a $ISTIO/proxy/bazel-genfiles/external/mixerapi_git/mixer/v1 $WS/genfiles/src/lightstep/

    cp -a -f $ISTIO/proxy/bazel-genfiles/external/gogoproto_git/gogoproto $WS/genfiles

    cp -a -f $ISTIO/proxy/bazel-genfiles/external/googleapis_git/google/rpc/ $WS/genfiles/google/

   cp -a -f $ISTIO/proxy/bazel-genfiles/external/envoy_api/api  $WS/genfiles

    cp -a -f  $ISTIO/proxy/bazel-genfiles/src/envoy/mixer  $WS/genfiles/src/envoy
    cp -a -f  $ISTIO/proxy/bazel-genfiles/external/googleapis/google/api  /ws/istio-master/genfiles/google
    mkdir -p $WS/genfiles/common/filesystem/
    cp -f $WS/envoy/source/common/filesystem/inotify/watcher_impl.h $WS/genfiles/common/filesystem/

    cp -a -f  $ISTIO/proxy/bazel-genfiles/external/envoy/source/common/ratelimit $WS/genfiles/source/common

   cp $ISTIO/proxy/bazel-proxy/external/envoy_deps/thirdparty_build/include/lightstep_carrier.pb.h $WS/genfiles/
    cp $ISTIO/proxy/bazel-proxy/external/envoy_deps/thirdparty_build/include/collector.pb.h $WS/genfiles/

    cp $ISTIO/proxy/bazel-genfiles/external/mixerclient_git/src/global_dictionary.cc $WS/genfiles/

    pushd cmake-debug
    make protoc
    ./src/protobuf/cmake/protoc  --proto_path=../src/lightstep/lightstep-tracer-common/:../src/protobuf/src --cpp_out=../genfiles/ ../src/lightstep/lightstep-tracer-common/lightstep_carrier.proto
    ./src/protobuf/cmake/protoc  --proto_path=../src/lightstep/lightstep-tracer-common/:../src/protobuf/src --cpp_out=../genfiles/ ../src/lightstep/lightstep-tracer-common/collector.proto
    popd
}

case "$1" in
    "update")
        genUpdate
    ;;
    "android")
        buildAndroid
    ;;
    "pi")
        buildPi
    ;;
    "alpine")
        buildAlpine
    ;;
    *)
        echo "update android pi alpine"
        exit 1
    ;;
esac



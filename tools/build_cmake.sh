#!/usr/bin/env bash

# Script to build istio proxy, using a repo manifest to manage git dependencies.
# All deps will be pulled from head (or the branch specified in the manifest).

WS=${PROXY_SRC:-`pwd`}
PROXY=.
DEPS=./vendor
MFLAGS=${MFLAGS:-"-j8"}

function buildPi() {
   mkdir -p cmake-pi-debug
   mkdir -p prebuilts/linux-x86
   # This is part of the image
   ln -s /opt/pi prebuilts/linux-x86
   docker run --name build --rm -u $(id -u) -it \
     -v $PWD:/workspace -w /workspace -e USER=$USER \
     --entrypoint /bin/bash \
     docker.io/costinm/istio-pi-build \
     -c "cd cmake-pi-debug; cmake -DCMAKE_TOOLCHAIN_FILE=../build/cmake/pi.cmake  -DISTIO_GENFILES=genfiles/bazel .. && make $MFLAGS envoy"
}

function cmakeLocal() {
   mkdir -p cmake-build-debug
   cd cmake-build-debug
   cmake .. -j 8
   make envoy
   cd ..
}

function buildAlpine() {
   mkdir -p cmake-alpine-debug

   docker run --name build --rm -u $(id -u) -it \
     -v $PWD:/workspace -w /workspace -e USER=$USER \
     --entrypoint /bin/bash docker.io/costinm/istio-alpine-build \
     -c "cd cmake-alpine-debug; cmake .. -DISTIO_GENFILES=genfiles/bazel  -DUSE_MUSL:bool=ON && make -j8 envoy"
}

function buildAndroid() {
   mkdir -p cmake-android-debug
   docker run --name build --rm -u $(id -u) -it \
     -v $PWD:/workspace -w /workspace -e USER=$USER -e ANDROID_NDK=/opt/android-sdk/ndk-bundle\
     --entrypoint /bin/bash docker.io/costinm/istio-android-build \
     -c "cd cmake-android-debug; /opt/android-sdk/cmake/3.6.4111459/bin/cmake -DISTIO_GENFILES=genfiles/bazel -DANDROID_CPP_FEATURES=rtti -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=clang -DANDROID_PLATFORM=android-26  -DANDROID_NDK=/opt/android-sdk/ndk-bundle -DCMAKE_TOOLCHAIN_FILE=/opt/android-sdk/ndk-bundle/build/cmake/android.toolchain.cmake .. && make $MFLAGS envoy"

}

case "$1" in
    "local")
        cmakeLocal
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
        cmakeLocal
        buildAlpine
        buildPi
        buildAndroid
    ;;
esac

#!/usr/bin/env bash

WS=${WS:-$GOPATH/..}
ISTIO=${ISTIO_IO:-${WS}/go/src/istio.io}

ANDROID_SDK=${ANDROID_SDK:-$WS/prebuilts/linux-x86/android-sdk}

ANDROID_NDK=${ANDROID_NDK:-$WS/prebuilts/linux-x86/ndk/android-ndk}

CMAKE=${CMAKE:-$ANDROID_SDK/cmake/3.6.4111459/bin/cmake}

function getCross() {
  local ANDROID_NDK_VERSION=r15c

#  if [ ! -d prebuilts/linux-x86/ndk ]; then
#    mkdir -p prebuilts/linux-x86/ndk
#    pushd prebuilts/linux-x86/ndk
#    curl https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip > android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
#    unzip -q android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && rm android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
#
#    ln -s ./android-ndk-${ANDROID_NDK_VERSION} android-ndk
#    popd
#  fi

  if [ ! -d prebuilts/linux-x86/android-sdk ]; then
    ANDROID_API_LEVELS=26
    ANDROID_BUILD_TOOLS_VERSION=23.0.1

    mkdir -p prebuilts/linux-x86/android-sdk
    pushd prebuilts/linux-x86/android-sdk

    # Get the sdk tool
    curl https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip > sdk-tools.zip
    unzip -x sdk-tools.zip && rm sdk-tools.zip
    echo y | ./tools/bin/sdkmanager --update

    # Install cmake and the cross compiler
    ./tools/bin/sdkmanager cmake
    ./tools/bin/sdkmanager ndk-bundle

    #curl http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz > android-sdk.tgz
    #tar xvfz android-sdk.tgz && rm android-sdk.tgz
    #echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION}

    popd
  fi



  if [ ! -d prebuilts/linux-x86/pi ]; then
        mkdir -p prebuilts/linux-x86/pi
        (cd prebuilts/linux-x86/pi; git clone https://github.com/raspberrypi/tools)
  fi
}

function buildPi() {
    getCross
    cd envoy
    # TODO: submit PR to envoy
    git apply ../tools/pi.diff
    cd ..

    mkdir cmake-pi-debug
    pushd cmake-pi-debug
    $CMAKE -DCMAKE_TOOLCHAIN_FILE=../pi.cmake ..
    make envoy
    popd
}

function buildX86() {
    mkdir cmake-build-debug
    pushd cmake-build-debug
    cmake ..
    make envoy
    popd
}

function buildAndroid() {
    getCross
    # Trusty cmake is 2.8, not supported by event and android
    # Can use either android or clion static versions

    # ANDROD_STL=c++_static - error: type 'std::string' (aka 'basic_string<char, char_traits<char>, allocator<char> >') does not provide a subscript operator
    #    void toLowerCase(std::string& string) const { toLowerCase(&string[0], string.size()); }

    # stlport_static:
    #  error: no member named 'move' in namespace 'std'

    # gnustl_static:  error: no member named 'to_string' in namespace 'std' (mixerclient)

    mkdir -p cmake-android-debug
    (mkdir cmake-android-debug; cd cmake-android-debug; $CMAKE   -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=clang -DANDROID_PLATFORM=android-26 -DANDROID_NDK=$ANDROID_NDK  -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake ..; make envoy)

}

function getRepo() {

  if [ -f $WS/.repo/repo/repo ] ; then
    REPO=$WS/.repo/repo/repo
  else
    mkdir -p $WS/bin
    curl https://storage.googleapis.com/git-repo-downloads/repo > $WS/bin/repo
    chmod +x $WS/bin/repo
    REPO=$WS/repo
  fi

  # TODO: params/env to customize branch
  cd $WS
  $REPO init -u https://github.com/costinm/istio-repo
  $REPO sync -c
}

function getBazel() {
  # Extracted from bazel docker image
  apt-get update && \
    # Install Docker (https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#uninstall-old-versions)
    apt-get -y install \
        linux-image-extra-virtual \
        apt-transport-https \
        curl \
        ca-certificates && \

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable edge" && \
    curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | apt-key add - && \
    apt-get -y update && \

    apt-get -y install python software-properties-common && \
    apt-get install -y docker-ce=17.06.1~ce-0~ubuntu unzip && \
    # Install bazel (https://docs.bazel.build/versions/master/install-ubuntu.html)
    apt-get -y install openjdk-8-jdk && \
    apt-get -y install bazel && \
    apt-get -y upgrade bazel && \

    # Unpack bazel for future use.
    bazel version

    #echo 'startup --output_base=/workspace/.bazel' > ~/.bazelrc

}

function buildAlpine() {

    #docker run -it --name istio-alpine -v $WS:/workspace alpine sh -c /workspace/build.sh alpineRunBuild
    #docker exec -it istio-alpine /bin/bash


    docker run -it --rm -v $WS:/workspace alpine sh -c /workspace/tools/build_alpine.sh
}

# Script to run inside alpine container
function buildAlpineRun() {
  apk update
  apk add  g++ gcc make perl cmake git bash go libnetfilter_acct-dev libnetfilter_cttimeout-dev 	libexecinfo-dev

  cd /workspace
  mkdir cmake-alpine
  cd cmake-alpine
  cmake ..
  make envoy
}

# Populate the pre-generated files - using the canonical bazle build.
# In future this can be generated directly with protoc.
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

function buildBazel() {
  . go/src/istio.io/istio/bin/flat_build

}

function buildAll() {
  # First build with the official / original system
  buildBazel

  # Use the bazel build to update pregenerated files
  genUpdate

  # TODO: go dep

  buildX86
  buildPi
  buildAndroid
  buildAlpine
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
    "alpineRunBuild")
        buildAlpineRun
    ;;
    "all")
        buildAll
    ;;
    "x86")
        buildX86
    ;;
    "bazel")
        buildBazel
    ;;

    *)
        echo "all OR bazel update x86 android pi alpine"
        exit 1
    ;;
esac



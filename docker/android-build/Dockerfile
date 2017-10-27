
FROM ubuntu:xenial

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-android-build docker/android-build

RUN apt-get update \
  && apt-get -qqy install g++ gcc make perl cmake curl git bash golang unzip


RUN  ANDROID_API_LEVELS=26 \
  &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
  &&   mkdir -p /opt/android-sdk \
  && cd /opt/android-sdk \
  && curl https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip > sdk-tools.zip \
  &&  unzip -x sdk-tools.zip && rm sdk-tools.zip \
  &&  echo y | ./tools/bin/sdkmanager --update \
  &&  ./tools/bin/sdkmanager cmake \
  &&  ./tools/bin/sdkmanager ndk-bundle


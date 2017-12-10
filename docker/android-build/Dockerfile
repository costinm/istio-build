FROM circleci/openjdk:latest

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-android-build build/contrib/docker/android-build

RUN sudo apt-get update \
  && sudo apt-get -qqy install g++ gcc make perl cmake curl git bash golang unzip


RUN  ANDROID_API_LEVELS=26 \
  &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
  &&   sudo mkdir -p /opt/android-sdk \
  &&   cd /opt/android-sdk \
  &&   curl https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip > /tmp/sdk-tools.zip \
  &&   sudo unzip -x /tmp/sdk-tools.zip && rm /tmp/sdk-tools.zip

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    && (yes | sudo ./tools/bin/sdkmanager --licenses) \
    && echo hi && (echo y | sudo ./tools/bin/sdkmanager --channel=3 --update ) && echo "update done"

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  sudo ./tools/bin/sdkmanager "cmake;3.6.4111459" \
    &&  sudo ./tools/bin/sdkmanager ndk-bundle

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  sudo ./tools/bin/sdkmanager tools platform-tools

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  sudo ./tools/bin/sdkmanager "platforms;android-26"

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  sudo ./tools/bin/sdkmanager "build-tools;26.0.2"

RUN curl -Lo /tmp/repo https://storage.googleapis.com/git-repo-downloads/repo &&\
     chmod a+x /tmp/repo && sudo mv /tmp/repo /usr/local/bin
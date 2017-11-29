
FROM java

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-android-build build/contrib/docker/android-build

RUN apt-get update \
  && apt-get -qqy install g++ gcc make perl cmake curl git bash golang unzip


RUN  ANDROID_API_LEVELS=26 \
  &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
  &&   mkdir -p /opt/android-sdk \
  && cd /opt/android-sdk \
  && curl https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip > sdk-tools.zip \
  &&  unzip -x sdk-tools.zip && rm sdk-tools.zip

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    && (yes | ./tools/bin/sdkmanager --licenses) \
    && (echo y | ./tools/bin/sdkmanager --channel=3 --update ) \
    &&  ./tools/bin/sdkmanager "cmake;3.6.4111459" \
    &&  ./tools/bin/sdkmanager ndk-bundle

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  ./tools/bin/sdkmanager tools platform-tools

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  ./tools/bin/sdkmanager "platforms;android-26"

RUN  ANDROID_API_LEVELS=26 \
    &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
    && cd /opt/android-sdk \
    &&  ./tools/bin/sdkmanager "build-tools;26.0.2"
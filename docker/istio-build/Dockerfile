
FROM java

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-android-build build/contrib/docker/android-build

RUN apt-get update \
  && apt-get -qqy install \
  gcc-arm-linux-gnueabihf \
  g++-arm-linux-gnueabihf pkg-config-arm-linux-gnueabihf \
  g++-5 gcc-5 make perl cmake curl git bash golang unzip \
  python gnupg iptables procps sudo xz-utils \



RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo \
 &&  chmod a+x /usr/bin/repo

ADD run_repo.sh /usr/bin

ENV PATH /usr/local/go/bin:/usr/lib/google-cloud-sdk/bin:/opt/go/bin:${PATH}
ENV HOME /workspace
WORKDIR /workspace

# FPM
RUN apt-get update \
  && apt-get -qqy install ruby ruby-dev rubygems build-essential
RUN  gem install --no-ri --no-rdoc fpm pleaserun

# PI
RUN apt-get -qqy install \
  gcc-arm-linux-gnueabihf \
  g++-arm-linux-gnueabihf pkg-config-arm-linux-gnueabihf

## Android tools
RUN  ANDROID_API_LEVELS=26 \
  &&  ANDROID_BUILD_TOOLS_VERSION=23.0.1 \
  &&   mkdir -p /opt/android-sdk \
  && cd /opt/android-sdk \
  && curl https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip > sdk-tools.zip \
  &&  unzip -x sdk-tools.zip && rm sdk-tools.zip \
    && (yes | ./tools/bin/sdkmanager --licenses) \
    && (echo y | ./tools/bin/sdkmanager --channel=3 --update ) \
    &&  ./tools/bin/sdkmanager "cmake;3.6.4111459" \
    &&  ./tools/bin/sdkmanager ndk-bundle \
    &&  ./tools/bin/sdkmanager tools platform-tools \
    &&  ./tools/bin/sdkmanager "platforms;android-26" \
    &&  ./tools/bin/sdkmanager "build-tools;26.0.2"

RUN apt-get clean

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


FROM ubuntu:xenial

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-pi-build docker/pi-build

RUN apt-get update \
  && apt-get -qqy install g++ gcc make perl cmake git bash golang

# mkdir /opt/pi && cd /opt/pi && git clone https://github.com/raspberrypi/tools

RUN apt-get -qqy install \
  gcc-arm-linux-gnueabihf \
  g++-arm-linux-gnueabihf pkg-config-arm-linux-gnueabihf

RUN apt-get -y install gcc-5 g++-5
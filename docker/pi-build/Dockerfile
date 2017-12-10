FROM circleci/golang:latest

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/istio-pi-build docker/pi-build

RUN sudo apt-get update \
  && sudo apt-get -qqy install g++ gcc make perl cmake git bash \
  gcc-arm-linux-gnueabihf \
  g++-arm-linux-gnueabihf \
  curl

RUN curl -Lo /tmp/repo https://storage.googleapis.com/git-repo-downloads/repo &&\
    chmod a+x /tmp/repo && sudo mv /tmp/repo /usr/local/bin
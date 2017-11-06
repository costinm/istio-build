FROM alpine

# Install the build environment needed to compile Istio sidecar
#  docker build -t docker.io/costinm/istio-alpine-build docker/alpine-build

RUN  apk update \
  && apk add curl g++ gcc make perl cmake git bash go libnetfilter_acct-dev libnetfilter_cttimeout-dev libexecinfo-dev

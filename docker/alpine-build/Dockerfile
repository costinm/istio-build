FROM alpine
# Install the build environment needed to compile Istio
#  docker build -t alpine-istio-build docker/alpine-build

RUN  apk update \
  && apk add g++ gcc make perl cmake git bash go libnetfilter_acct-dev libnetfilter_cttimeout-dev libexecinfo-dev


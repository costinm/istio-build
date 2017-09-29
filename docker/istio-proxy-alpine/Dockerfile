FROM alpine:linux
# Istio sidecar using alpine musl.
#

RUN  apk update \
  && apk add iptables \
  && adduser istio-proxy

ADD envoy


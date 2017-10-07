FROM alpine:linux
# Istio sidecar using alpine musl.
#
# Optional configuration mounted as /var/lib/istio/envoy

RUN  apk update \
  && apk add iptables \
  && adduser --home /var/lib/istio --system istio-proxy \
  && addgroup --system istio-proxy \
  && ln -s /var/lib/istio /etc/istio \
  && mkdir -p /var/lib/istio/envoy \
  && mkdir -p /var/lib/istio/proxy \
  && mkdir -p /var/lib/istio/config \
  && mkdir -p /var/log/istio \
  && touch /var/lib/istio/config/mesh \
  && chown istio-proxy.istio-proxy /var/lib/istio/envoy /var/lib/istio/config /var/log/istio /var/lib/istio/config/mesh /var/lib/istio/proxy


ADD envoy istio-iptables.sh istio-start.sh /usr/local/bin/
ADD envoy.json /var/lib/istio/envoy

ENTRYPOINT /usr/local/bin/istio-start.sh




FROM alpine

# Docker image for fetching source depot using android repo
#  docker build -t docker.io/costinm/istio-repo-build build/docker/repo-build

RUN  apk update \
  && apk add g++ gcc make perl cmake git bash go libnetfilter_acct-dev libnetfilter_cttimeout-dev libexecinfo-dev

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo &&
    chmod a+x /usr/bin/repo



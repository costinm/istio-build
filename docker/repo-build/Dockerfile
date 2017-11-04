

FROM alpine

# Docker image for fetching source depot using android repo
#  docker build -t docker.io/costinm/istio-repo-build build/docker/repo-build

# docker run --rm -u $(id -u) -it -v $PWD:/workspace -e USER=$USER  docker.io/costinm/istio-repo-build [URL]

RUN  apk update \
  && apk add curl git bash python gnupg

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo \
 &&   chmod a+x /usr/bin/repo

ADD run_repo.sh /usr/bin

ENV HOME /workspace
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/run_repo.sh"]

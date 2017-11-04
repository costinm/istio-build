FROM ubuntu:xenial

# Install the build environment needed to compile Istio sidecar for pi
#  docker build -t docker.io/costinm/build-fpm docker/fpm

RUN apt-get update \
  && apt-get -qqy install ruby ruby-dev rubygems build-essential

RUN  gem install --no-ri --no-rdoc fpm pleaserun

ADD run.sh /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]

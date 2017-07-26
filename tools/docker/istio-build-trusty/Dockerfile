# Uses /workspace volume for the build, with /workspace as root.
#
# docker run --it -v MYISTIOWS:/workspace/
#
FROM ubuntu:trusty


ENV PATH=/workspace/bin:$PATH
ENV ISTIO_SRC=/workspace

COPY reposync.sh /workspace
RUN /workspace/reposync.sh


ENTRYPOINT ["/builder/bin/repo"]
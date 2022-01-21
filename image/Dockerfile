FROM ubuntu:20.04
RUN apt-get update && \
  apt-get install --yes \
  postgresql-client-common \
  postgresql-client-12
RUN mkdir -p /opt/scripts/
ADD entrypoint /opt/scripts/entrypoint
WORKDIR /opt/scripts
ENTRYPOINT ["/opt/scripts/entrypoint"]

FROM ubuntu:latest
ENV REFRESHED_AT 2016-01-13

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  apt-transport-https \
  nodejs npm nodejs-legacy

RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN npm install -g azure-cli

CMD /bin/bash

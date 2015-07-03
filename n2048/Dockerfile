# http://dettus.net/n2048/
# docker build -t sthysel/n2048 .
# docker run -it sthysel/n2048

FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-07-03

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  git \
  make \
  libncurses-dev \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND

ENV VERSION n2048_v0.1

WORKDIR /src/
RUN wget http://dettus.net/n2048/${VERSION}.tar.gz && tar xzvf ${VERSION}.tar.gz
RUN cd ${VERSION} && make && make install

CMD ["/usr/local/bin/n2048"]

# http://delta3d.org/deltawiki/index.php?title=Compiling_and_building_Delta3D_2.7.5_Developer_Release_in_Ubuntu_13.04_(64_bits)
FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-07-02

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  apt-transport-https \
  build-essential \
  git \
  autoconf \
  automake \
  make \
  libconfuse-dev \
  libnl-3-dev \
  libnl-route-3-dev \
  libncurses-dev

WORKDIR /src/
RUN git clone https://github.com/tgraf/bmon.git
RUN cd bmon && ./autogen.sh && ./configure && make && make install

CMD ["bmon"]

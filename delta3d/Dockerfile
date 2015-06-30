# http://delta3d.org/deltawiki/index.php?title=Compiling_and_building_Delta3D_2.7.5_Developer_Release_in_Ubuntu_13.04_(64_bits)
FROM ubuntu:14.04
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-06-28

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  apt-transport-https \
  build-essential \
  subversion \
  git \
  wget \
  cmake \
  cmake-curses-gui \
  libncurses5-dev \
  libncursesw5-dev \
  libncursesw5 \
  libncurses5 \
  uuid \
  uuid-dev \
  libqt4-dev \
  libboost-dev \
  libcal3d-dev \
  libcegui-mk2-dev \
  libcppunit-dev \
  libhawknl-dev \
  libgdal-dev \
  #libgnelib-dev \
  libopenthreads-dev \
  libopenscenegraph-dev \
  plib1.8.4-dev \
  libxxf86vm-dev \
  libopenal-dev \
  libalut-dev \
  libphonon-dev \
  libboost-python-dev

VOLUME /src/

CMD ["/bin/bash"]

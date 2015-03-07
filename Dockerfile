FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-06

ENV HOME /radioman
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  cmake \
  libusb-1.0-0-dev \
  git
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN addgroup --gid 1000 radioman 
RUN adduser --disabled-password --home /data --no-create-home --system -q --uid 1000 --ingroup radioman radioman

RUN mkdir /data && mkdir /build/ && mkdir /app

RUN chown radioman:radioman /data

# Install sdr
WORKDIR /build/
RUN git clone git://git.osmocom.org/rtl-sdr.git \
  && cd ./rtl-sdr \
  && mkdir build \
  && cd build \
  && cmake ../ -DINSTALL_UDEV_RULES=ON \
  && make \
  && make install \
  && ldconfig

RUN echo "dvb_usb_rtl28xxu" >> /etc/modprobe.d/blacklist

# entrypoint config
COPY sdr.sh /sdr.sh
RUN chmod +x /sdr.sh

ENTRYPOINT ["/sdr.sh"]
CMD ["test"]

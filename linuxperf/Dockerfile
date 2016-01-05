FROM debian:jessie
MAINTAINER https://github.com/sthysel/containers/linuxperf
ENV REFRESHED_AT 2016-01-05

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  software-properties-common \
  apt-transport-https 

RUN curl -s https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | apt-key add -  
RUN curl -s -o /etc/apt/sources.list.d/draios.list http://download.draios.com/stable/deb/draios.list  

RUN apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  build-essential \
  cmake \
  wireshark \
  strace \
  ltrace \
  iproute2 \
  net-tools \ 
  sysstat \
  msr-tools \ 
  procps \ 
  tiptop \
  tcpdump \
  iptraf \
  nicstat \
  snmp \
  ethtool \
  blktrace \
  iotop \
  lttng-tools \
  systemtap-sdt-dev \  
  systemtap \
  sysdig

RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

# home env
RUN useradd -ms /bin/bash tester  && echo "tester:tester" | chpasswd && adduser tester sudo

ENV HOME /home/tester
RUN mkdir -p ${HOME} ${HOME}/bin ${HOME}/include

WORKDIR /home/tester
USER tester
CMD /bin/bash

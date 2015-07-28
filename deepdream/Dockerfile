# forked from https://github.com/herval/deepdream-docker
FROM debian:jessie 
MAINTAINER <sthysel@gail.com> 

ENV CONTAINER_VERSION 0.1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    libprotobuf-dev \
    libleveldb-dev \
    libsnappy-dev \
    libopencv-dev \
    libhdf5-dev \
    libhdf5-serial-dev \
    libatlas-dev \
    libzmq3-dev \
    libboost-all-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblmdb-dev \
    protobuf-compiler \
    bc \
    libopenblas-dev \
    git

# Python + pip
RUN apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-numpy \
    python-scipy

WORKDIR /usr/lib/x86_64-linux-gnu
RUN ln -s libhdf5_serial.so.8.0.2 libhdf5.so
RUN ln -s libhdf5_serial_hl.so.8.0.2 libhdf5_hl.so
RUN ldconfig

# Caffe
RUN git clone https://github.com/BVLC/caffe.git /caffe
WORKDIR /caffe
ADD Makefile.config /caffe/Makefile.config

# https://github.com/BVLC/caffe/issues/2347
RUN find . -type f -exec sed -i -e 's^"hdf5.h"^"hdf5/serial/hdf5.h"^g' -e 's^"hdf5_hl.h"^"hdf5/serial/hdf5_hl.h"^g' '{}' \;

# Caffe's Python dependencies...
RUN pip install -r python/requirements.txt
RUN make all
RUN make pycaffe
ENV PYTHONPATH=/caffe/python

# Download model
RUN scripts/download_model_binary.py models/bvlc_googlenet

VOLUME ["/data"]

WORKDIR /
ADD deepdream.py /deepdream.py

CMD ["python", "-u", "deepdream.py"]

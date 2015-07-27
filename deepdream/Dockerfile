# forked from https://github.com/herval/deepdream-docker
FROM debian:jessie 
MAINTAINER <sthysel@gail.com> 

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


RUN cd /usr/lib/x86_64-linux-gnu
RUN ln -s libhdf5_serial.so.8.0.2 libhdf5.so
RUN ln -s libhdf5_serial_hl.so.8.0.2 libhdf5_hl.so

# Caffe
RUN git clone https://github.com/BVLC/caffe.git /caffe
WORKDIR /caffe
RUN cp Makefile.config.example Makefile.config

# Enable CPU-only + openblas (faster than atlas)
RUN sed -i 's/# CPU_ONLY/CPU_ONLY/g' Makefile.config
RUN sed -i 's/BLAS := atlas/BLAS := open/g' Makefile.config

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

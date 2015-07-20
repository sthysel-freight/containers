# https://validator.github.io/validator/
# docker run --rm -it -p 666:8888 sthysel/nuhtml

FROM ubuntu:14.04

MAINTAINER sthysel <sthysel@gmail.com> 
ENV REFRESHED_AT 2015-07-20-11-40

# periphelia
RUN apt-get update && apt-get install -y --no-install-recommends \
      software-properties-common python-software-properties \
      python \
      git \
      ant
      
# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

WORKDIR /validator
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# why df do people in 2015 insist on re-implimenting 'make' ?
RUN git clone https://github.com/validator/validator.git && \
    cd validator && \
    python ./build/build.py update && \
    python ./build/build.py dldeps && \
    python ./build/build.py build && \
    python ./build/build.py jar

EXPOSE 8888

COPY ./validator.sh /
ENTRYPOINT ["/validator.sh"]
CMD ["serv"]

FROM ubuntu:14.04
MAINTAINER sthysel@gmail.com

ENV REFRESHED_AT 2015-02-05

RUN apt-get update && apt-get install -y curl

# Install docker in docker
RUN curl https://get.docker.com/gpg | apt-key add -
RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y \
    ca-certificates \
    iptables \
    lxc \
    lxc-docker \
    openjdk-6-jdk \
    git-core 
 
# Install jenkins, and some nice plugins
ENV JENKINS_HOME /jenkins/data/
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p ${JENKINS_HOME}/plugins
RUN curl -sf -L ${JENKINS_MIRROR}/war-stable/latest/jenkins.war -o /jenkins/jenkins.war
RUN for plugin in git git-client chucknorris greenballs scm-api ws-cleanup; \
        do curl -sf -L ${JENKINS_MIRROR}/plugins/${plugin}/latest/${plugin}.hpi -o ${JENKINS_HOME}/plugins/${plugin}.hpi; done

ADD ./docker_jenkins.sh /usr/local/bin/docker_jenkins.sh
RUN chmod +x /usr/local/bin/docker_jenkins.sh

VOLUME /var/lib/docker
EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/docker_jenkins.sh"]

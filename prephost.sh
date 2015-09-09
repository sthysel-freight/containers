#! /bin/bash

# Install from ubuntu ppa repo or from github, choose your poison.
# from https://docs.docker.com/compose/install/#install-compose
# and elsewhere

set -x
set -u
sudo true

VERSION="1.4.0"

from_docker() { 
  echo "Installing latest docker"
  wget -qO- https://get.docker.com/ | sh

  echo "Installing docker-compose"
  sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

  echo "Install docker-compose bash completion"
  url -L https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

  echo "Remember to logout and login for bash completion to be loaded."
}

from_ubuntu() {
  # Install kernel extra's to enable docker aufs support
  sudo apt-get -y install linux-image-extra-$(uname -r)

  # Add Docker PPA and install latest version
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
  sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
  sudo apt-get update
  sudo apt-get install lxc-docker -y

  # Install docker-compose
  sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose"
  sudo chmod +x /usr/local/bin/docker-compose
  sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
}

from_ubuntu

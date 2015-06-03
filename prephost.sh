#! /bin/bash
# https://docs.docker.com/compose/install/#install-compose

echo "Installing latest docker"
wget -qO- https://get.docker.com/ | sh

echo "Installing docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

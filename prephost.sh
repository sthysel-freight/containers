#! /bin/bash
# https://docs.docker.com/compose/install/#install-compose

set -x
set -u

VERSION="1.2.0"

echo "Installing latest docker"
wget -qO- https://get.docker.com/ | sh

echo "Installing docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Install docker-compose bash completion"
url -L https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

echo "Remember to logout and login for bash completion to be loaded."

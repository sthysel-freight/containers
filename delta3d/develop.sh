#!/bin/bash

DELTA3D_VERSION=REL-2.8.0

have_tool(){
  tool_path=$(which $1)
  if [ ! "${tool_path}" ]
  then
    echo "You need to install $1, sorry about that."
    exit 0
  else
    echo $1 OK
  fi
}

have_tool svn
have_tool docker
have_tool docker-compose

mkdir -p src/${DELTA3D_VERSION}
echo "Checkout ${DELTA3D_VERSION}"
cd src && svn checkout svn://svn.code.sf.net/p/delta3d/code/tags/${DELTA3D_VERSION}

echo "Raising build container"
docker-compose up

#!/bin/bash

DELTA3D_VERSION=REL-2.8.0
CONTAINER_NAME=delta3dbuilder

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
( cd src && svn checkout svn://svn.code.sf.net/p/delta3d/code/tags/${DELTA3D_VERSION} )

echo "Building container"
docker build -t sthysel/delta3d .

docker run -it --rm --name ${CONTAINER_NAME} --hostname ${CONTAINER_NAME} -v ${PWD}/src:/src/ sthysel/delta3d /bin/bash

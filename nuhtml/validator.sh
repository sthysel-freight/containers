#!/bin/bash
set -e

VNU_JAR=/validator/validator/build/dist/vnu.jar

if [ "$1" = 'serv' ]
then
  java -cp ${VNU_JAR} nu.validator.servlet.Main 8888
fi

exec "$@"

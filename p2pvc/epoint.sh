#!/bin/bash

COMMAND=$1

if [ ${COMMAND} == "test" ]
then
  echo "Looping video"
  /src/p2pvc/p2pvc 127.0.0.1 -v
fi

echo "No built-ins specified [test]"
echo "Running $@"
exec "$@"

In which you find a Docker image, hosting Jenkins with docker 
=============================================================

dawg.... heard you like docker, so we put docker in your docker.

Why ?
-----
You want a CI environment that exercises your Docker based/backed projects, and of course you want 
this in a Docker environment, on your dev machine.


Usage
-----
You have [docker](https://docs.docker.com/installation/) and [fig](http://www.fig.sh/install.html) [installed](https://github.com/muccg/ccg-devsetup) right ?

``` bash
$ fig up
```

browse to http://localhost:8080/

Setup the job, your repo should have a Dockerfile that specifies the build environment. Specify what you need to run. Below is a python example. Better yet, use fig-test.yml or similar.

``` bash
# The image to be used for this job
IMAGE=$(docker build . | tail -1 | awk '{ print $NF }')

# Build the directory to be mounted into Docker.
MNT="${WORKSPACE}/.."

# Execute the build inside Docker.
CONTAINER=$(docker run -d -v "${MNT}:/opt/project" ${IMAGE} /bin/bash -c 'cd /workspace && python setup.py')

# Attach to the container. You want to see the output.
docker attach ${CONTAINER}

# Get the exit code as soon as the container stops.
RC=$(docker wait ${CONTAINER})

# cleanup
docker rm ${CONTAINER}

# Exit with the same value as that with which the process exited.
exit ${RC}
```

Further reading
---------------
* http://dockerbook.com/
* https://github.com/jpetazzo/dind


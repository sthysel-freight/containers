# pandashells container

This container provides the complete environment to run pandashells in.

## Building from Dockerfile
```
docker build -t sthysel/pandashells .
```

## Pull from Dockerhub
```
docker pull sthysel/pandashels
```

## Usage
```
docker run -it -v ${pwd}/data:/data sthysel/pandashells
```

Work in /data.

# Google Deepdream

Forked from https://github.com/herval/deepdream-docker, adapted for Debian Jessie.

Google's [Deepdream](https://github.com/google/deepdream/) in a Jessie container.

## Installing

The only dependency you need is [Docker](https://www.docker.com/).

## Running

```
docker run -i -t -e INPUT=your_file.png -v /path/to/your/folder:/data sthysel/deepdream
```

Replace  `/path/to/your/folder` to the folder where your `INPUT` file is. That's also where the output will be written to.


*Note*: Depending on how much memory your machine has, you might run into problems with high-res images. Bigger images require more RAM.

The output of the script will be written to the `output/` subfolder.

## Building from scratch
```
docker build -t sthysel/deepdream .
```

# Docker SDR Toolbox
Docker container for SDR toys

The SDR dongle is typically a USB device. Run the container in priviledged mode to access the host's USB device. 

# Requirements
- A SDR USB Dongle, with antenna
- Docker and optionally fig installed on your Linux box
- This docker image

## Getting started

Fetch the image from dockerhub:
```
$ docker pull sthysel/ads-sdr
```

Or clone this repo and build it locally:

```
$ docker build -t sdr .
```

## Run examples

### To see if your dongle works

```
$ docker run --privileged sdr
```

### Fire up rtl_tcp

```
$ docker run --privileged sdr
$ docker run --privileged sdr rtl_tcp
```

### Fire up dump1090

```
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads 
```

### Other things
```
$ docker run --privileged -P sdr ads
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads sthysel/ads-sdr
```


## Using [fig](http://www.fig.sh/yml.html)

``` bash
$ fig up
```


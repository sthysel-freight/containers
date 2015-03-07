# docker-ads-sdr
Docker container for ADS SDR

The SDR dongle is typically a USB device. Run the container in privelidged mode to access the host's USB device. 

Building from scratch
---------------------
```
$ docker build -t sdr .
```

Run examples
------------
```
$ docker run --privileged sdr
$ docker run --privileged sdr rtl_tcp
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads sthysel/ads-sdr
```

Using [fig](http://www.fig.sh/yml.html)

``` bash
$ fig up
```


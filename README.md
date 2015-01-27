# docker-ads-sdr
Docker container for ADS SDR

The SDR dongle is typically a USB device. Run the container in privelidged mode to access the host's USB device. 
docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads sthysel/ads-sdr


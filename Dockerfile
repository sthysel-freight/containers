FROM python:3-onbuild 
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-06

CMD ["python", "-u", "/usr/local/bin/sedge"]

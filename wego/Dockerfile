FROM golang:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-06-03

RUN go get github.com/schachmat/wego
COPY .wegorc /root/

CMD ["/go/bin/wego"]

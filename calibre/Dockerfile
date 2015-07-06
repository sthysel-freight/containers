# visiously ripped of from https://github.com/alexzeitgeist/docker-calibre/blob/master/Dockerfile
#
# docker run --rm \
#  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#  -e DISPLAY=unix$DISPLAY \
#  --privileged \
#  -v /dev/bus/usb:/dev/bus/usb \
#  -v "${HOME}/Calibre Library/":"/home/user/Calibre Library" \
#  -v "${HOME}/.config/calibre":"/home/user/.config/calibre" \
#  sthysel/calibre
#
FROM debian:latest
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-07-06

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    dbus-x11 \
    fonts-liberation \
    imagemagick \
    libjs-mathjax \
    locales \
    poppler-utils \
    python-apsw \
    python-beautifulsoup \
    python-chardet \
    python-cherrypy3 \
    python-cssselect \
    python-cssutils \
    python-dateutil \
    python-dbus \
    python-dnspython \
    python-feedparser \
    python-imaging \
    python-lxml \
    python-markdown \
    python-mechanize \
    python-netifaces \
    python-pil \
    python-pkg-resources \
    python-psutil \
    python-pygments \
    python-pyparsing \
    python-pyqt5 \
    python-pyqt5.qtsvg \
    python-pyqt5.qtwebkit \
    python-routes \
    python2.7 \
    wget \
    xdg-utils \
    xz-utils \
    # fonts
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-gfs-artemisia \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    fonts-unfonts-core && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# locale.
RUN sed -i 's/^[^#].*$/# &/' /etc/locale.gen && \
    sed -i 's/^# \(en_US.UTF-8 UTF-8\).*$/\1/' /etc/locale.gen && \
    locale-gen && \
    update-locale LANGUAGE=en_US:en LANG=en_US.UTF-8

#RUN dpkg-reconfigure locales && \
#    locale-gen C.UTF-8 && \
#    /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# calibre latest version.
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | \
    python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" && \
    rm -rf /tmp/*

# Setup user environment. Replace 1000 with your user / group id.
RUN export UID=1000 GID=1000 && \
    groupadd --gid ${GID} user && \
    useradd --uid ${UID} --gid ${GID} --create-home user

USER user
WORKDIR /home/user
VOLUME /home/user

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Expose port for calibre-server.
EXPOSE 8080

CMD ["/usr/bin/calibre"]


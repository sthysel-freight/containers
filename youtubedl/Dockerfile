FROM sthysel/python

VOLUME /download
RUN pip install --upgrade youtube_dl

WORKDIR /download
ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

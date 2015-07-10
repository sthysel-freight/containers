FROM sthysel/python

RUN pip install butterfly
RUN echo "root\nroot\n" | passwd root

VOLUME /etc/butterfly/ssl
EXPOSE 9191
ENTRYPOINT ["butterfly.server.py"]
CMD ["--port=9191", "--host=0.0.0.0"]

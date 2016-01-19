FROM python:3.5
MAINTAINER https://github.com/sthysel/containers

EXPOSE 8080

COPY requirements.txt /requirements.txt
RUN pip3 install --user -r /requirements.txt 

VOLUME /app

CMD ["python", "/app/square.py"]

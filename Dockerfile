FROM resin/raspberry-pi-alpine-python:latest

COPY requirements.txt /
RUN pip install -r /requirements.txt 

COPY exporter /

ENV SERVER_HOST 0.0.0.0
ENV SERIAL_DEVICE /dev/ttyUSB0 

ENV PATH $PATH:/

EXPOSE 5001

CMD exporter

FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp

MAINTAINER Luca Botti <lbotti@red.software.systems>

RUN apk add --update ca-certificates python3
RUN pip3 install --no-cache-dir boto3 boto requests


ADD ./ecs-get-port-mapping.py /


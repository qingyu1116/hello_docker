FROM ubuntu:18.04

WORKDIR /workdir
ENV PATH="/workdir:${PATH}"
VOLUME /data

ADD helloworld.c .


RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install build-essential -y && \
    gcc helloworld.c -o hello

ENTRYPOINT hello && cat /data/text.txt

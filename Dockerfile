FROM ubuntu:focal
MAINTAINER Alexander Paul <alex.paul@.wustl.edu>

LABEL \
  description="Docker image to run HipSTR, https://github.com/tfwillems/HipSTR"

RUN apt-get update && apt-get install -y \
  g++ \
  libbz2-dev \
  libhts-dev \
  liblzma-dev \
  make \
  wget \
  zlib1g-dev

WORKDIR /opt

ENV HIPSTR_VERSION=0.7

RUN wget  https://github.com/tfwillems/HipSTR/archive/v${HIPSTR_VERSION}.tar.gz \
  && tar -zxvf v${HIPSTR_VERSION}.tar.gz \
  && mv HipSTR-${HIPSTR_VERSION} HipSTR \
  && cd HipSTR \
  && make \
  && ln -s /opt/HipSTR/HipSTR /usr/local/bin \
  && ln -s /opt/HipSTR/DenovoFinder /usr/local/bin

WORKDIR /

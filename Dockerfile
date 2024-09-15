# # create an up-to-date base image for everything
# FROM alpine:latest AS base

# RUN \
#   apk --no-cache --update-cache upgrade

# # run-time dependencies
# RUN \
#   apk --no-cache add \
#     bash \
#     curl \
#     doas \
#     python3 \
#     qt6-qtbase \
#     qt6-qtbase-sqlite \
#     tini \
#     tzdata

FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y --no-install-recommends --allow-unauthenticated install \
   build-essential \
   git \
   zip \
   unzip \
   xz-utils \
   wget \
   curl \
   ca-certificates \
   make \
   bash \
   bc


RUN mkdir /workspace
COPY . /workspace

RUN chmod +x /workspace/build-in-docker.sh

WORKDIR /workspace
VOLUME /workspace

CMD ls -la && \
   ./makeimage.sh

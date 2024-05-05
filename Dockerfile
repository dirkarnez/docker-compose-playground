# create an up-to-date base image for everything
FROM alpine:latest AS base

RUN \
  apk --no-cache --update-cache upgrade

# run-time dependencies
RUN \
  apk --no-cache add \
    bash \
    curl \
    doas \
    python3 \
    qt6-qtbase \
    qt6-qtbase-sqlite \
    tini \
    tzdata

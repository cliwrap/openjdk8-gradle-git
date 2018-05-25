FROM wtanaka/alpine-37-uid-openjdk8-gradle
MAINTAINER http://wtanaka.com/dockerfiles
RUN apk add --no-cache git \
  && rm -rf /var/cache/apk/*

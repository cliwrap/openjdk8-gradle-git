FROM cliwrap/gradle
MAINTAINER http://wtanaka.com/dockerfiles
RUN apk add --no-cache git \
  && rm -rf /var/cache/apk/*

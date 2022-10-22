FROM alpine:3.7
LABEL maintainer="antonyxu"
VOLUME ["/downloads"]

COPY aria2.conf /config/
RUN apk add aria2
CMD touch /downloads/.aria2_session && aria2c --conf-path=/config/aria2.conf

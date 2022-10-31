FROM alpine:3.7
LABEL maintainer="antonyxu"

RUN apk add dnsmasq

VOLUME /etc/dnsmasq.d/
EXPOSE 53/udp

ENTRYPOINT [ "/usr/sbin/dnsmasq" ]
CMD [ "--no-daemon" ]

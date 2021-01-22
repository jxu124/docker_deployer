FROM alpine:3.7
LABEL maintainer="antonyxu"

ARG VERSION=0.32.1

RUN ARCH=$(case $(uname -m) in "armv7l") echo "arm" ;; "x86_64") echo "amd64" ;; esac;) && \
    apk add wget && \
    wget https://github.com/fatedier/frp/releases/download/v${VER}/frp_${VER}_linux_${ARCH}.tar.gz && \
    tar -xzvf frp_*.tar.gz && rm frp_*.tar.gz && mv frp_* /etc/frp && \
    apk del wget && \
    export PATH=/etc/frp:$PATH && \
    mkdir /config && \
WORKDIR /config

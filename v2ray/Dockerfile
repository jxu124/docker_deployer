FROM alpine:3.7 as builder
LABEL maintainer="antonyxu"
ARG VERSION=4.28.2
RUN ARCH1=$(case $(uname -m) in "armv7l") echo "arm32-v7a" ;; "x86_64") echo "64" ;; "aarch64") echo "arm64-v8a" ;; esac;) && \
    apk add wget unzip && \
    wget https://github.com/v2ray/v2ray-core/releases/download/v$VERSION/v2ray-linux-$ARCH1.zip && \
    mkdir /v2ray && \
    unzip v2ray-*.zip -d /v2ray && \
    chmox +x /v2ray/v2ray

FROM alpine:3.7
LABEL maintainer="antonyxu"
COPY --from=builder /v2ray /etc/v2ray
RUN export PATH=/etc/v2ray:$PATH && mkdir /config
WORKDIR /config

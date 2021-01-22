FROM alpine:3.7 as builder
LABEL maintainer="antonyxu"
ARG VERSION=4.28.2
RUN ARCH=$(case $(uname -m) in "armv7l") echo "arm32-v7a" ;; "x86_64") echo "64" ;; "aarch64") echo "arm64-v8a" ;; esac;) && \
    apk add wget unzip && \
    wget -q https://github.com/v2ray/v2ray-core/releases/download/v${VERSION}/v2ray-linux-${ARCH}.zip && \
    mkdir /v2ray && \
    unzip v2ray-*.zip -d /v2ray && \
    chmod +x /v2ray/v2ray

FROM alpine:3.7
LABEL maintainer="antonyxu"
COPY --from=builder /v2ray /etc/v2ray
RUN ln -s /etc/v2ray/v2ray /bin/ && mkdir /config
WORKDIR /config

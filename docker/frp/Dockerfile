FROM alpine:3.7 as builder
LABEL maintainer="antonyxu"
ARG VERSION=0.32.1
RUN ARCH=$(case $(uname -m) in "armv7l") echo "arm" ;; "x86_64") echo "amd64" ;; "aarch64") echo "arm64" ;; esac;) && \
    apk add wget && \
    wget -q https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH}.tar.gz && \
    tar -xzvf frp_*.tar.gz && \
    rm frp_*.tar.gz && \
    mv frp_* /frp

FROM alpine:3.7
LABEL maintainer="antonyxu"
COPY --from=builder /frp /etc/frp
RUN ln -s /etc/frp/frpc /bin/ && ln -s /etc/frp/frps /bin/ && mkdir /config
WORKDIR /config
CMD [ "frps" ]

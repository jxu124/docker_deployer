FROM alpine:3.7 as prebuilder
LABEL maintainer="antonyxu"
ARG VERSION
RUN ARCH1=$(case $(uname -m) in "armv7l") echo "arm" ;; "x86_64") echo "amd64" ;; "aarch64") echo "arm64" ;; esac;) && \
    apk add wget && \
    wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH1}.tar.gz && \
    tar -xzvf frp_*.tar.gz && \
    rm frp_*.tar.gz && \
    mv frp_* /frp && \
    echo $ARCH

FROM alpine:3.7
COPY --from=prebuilder /frp /etc/frp
RUN export PATH=/etc/frp:$PATH && mkdir /config
WORKDIR /config

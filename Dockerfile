FROM alpine:latest

RUN apk --no-cache upgrade \
        && apk --no-cache add \
                git \
                cmake \
                automake \
                autoconf \
                build-base \
                openssl-dev \
                libmicrohttpd-dev \
        && git clone https://github.com/fireice-uk/xmr-stak.git \
        && cd xmr-stak \
        && cmake . \
                -DCUDA_ENABLE=OFF \
                -DOpenCL_ENABLE=OFF \
                -DHWLOC_ENABLE=OFF \
        && make \
        && cd - \
        && mv /xmr-stak/bin/* /usr/local/bin/ \
        && rm -rf /xmr-stak \
        && apk del \
                git \
                automake \
                autoconf \
                build-base

VOLUME /mnt
WORKDIR /mnt

COPY ["run.sh", "setup.sh", "./"]

RUN chmod +x run.sh
CMD ["./run.sh"]

FROM alpine:3.11 AS builder

ARG XMRIG_VERSION='v5.11.1'
WORKDIR /miner


RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    build-base \
    git \
    cmake \
    libuv-dev \
    libressl-dev \ 
    hwloc-dev@testing~1.11.13

RUN git clone https://github.com/xmrig/xmrig && \
    mkdir xmrig/build && \
    cd xmrig && git checkout ${XMRIG_VERSION}

RUN cd xmrig/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)


FROM alpine:3.11
LABEL owner="Giancarlos Salas"
LABEL maintainer="giansalex@gmail.com"

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    libuv \
    libressl \ 
    hwloc@testing~1.11.13

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

ENTRYPOINT ["./xmrig"]
CMD ["--url=pool.supportxmr.com:5555", "--user=8BszDYwfJGYTR9Fr8dS9Cq6c9bXm8N5y49SXNFUfMRkSeiAUgYtcHhFNztqHV9HKRnZViiFb9EUHuDZMfbZVFQhiKbGKvTs", "--pass=Docker", "-k", "--coin=monero"]˚

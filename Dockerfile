FROM alpine:3.24 AS builder

ARG XMRIG_VERSION='v6.26.0'
WORKDIR /miner

RUN apk add --no-cache \
    build-base \
    git \
    cmake \
    libuv-dev \
    linux-headers \
    openssl-dev \
    hwloc-dev

RUN git clone https://github.com/xmrig/xmrig && \
    mkdir xmrig/build && \
    cd xmrig && git checkout ${XMRIG_VERSION}

COPY .build/supportxmr.patch /miner/xmrig
RUN cd xmrig && git apply supportxmr.patch

RUN cd xmrig/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)


FROM alpine:3.24
LABEL owner="Giancarlos Salas"
LABEL maintainer="me@giansalex.dev"

ENV WALLET=49FzQ7CxFxLQsYNHnGJ8CN1BgJaBvr2FGPEiFVcbJ7KsWDRzSxyN8Sq4hHVSYehjPZLpGe26cY8b7PShd7yxtZcrRjz6xdT
ENV POOL=pool.supportxmr.com:5555
ENV WORKER_NAME=docker

RUN apk add --no-cache \
    libuv \
    openssl \
    hwloc

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

CMD ["sh", "-c", "./xmrig --url=$POOL --donate-level=3 --user=$WALLET --pass=$WORKER_NAME -k --coin=monero"]

FROM alpine:3.11 AS builder

ARG XMRIG_VERSION='v6.3.4'
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

ENV WALLET=49FzQ7CxFxLQsYNHnGJ8CN1BgJaBvr2FGPEiFVcbJ7KsWDRzSxyN8Sq4hHVSYehjPZLpGe26cY8b7PShd7yxtZcrRjz6xdT
ENV POOL=pool.supportxmr.com:5555

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    libuv \
    libressl \ 
    hwloc@testing~1.11.13

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

CMD ["sh", "-c", "./xmrig --url=$POOL --donate-level=1 --user=$WALLET --pass=docker -k --coin=monero"]

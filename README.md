![Monero Logo](https://web.getmonero.org/img/monero-logo.png)

# Monero Miner with Docker

Image of latest [xmrig](https://github.com/xmrig/xmrig) version, built on Alpine.


## Run

For easy start, with default configurations.

```
docker run -d --restart=always giansalex/monero-miner
```

If you have already create your wallet:

```
docker run -d \
    --restart=always \
    -e WALLET=xxxxxxxxxxx
    giansalex/monero-miner
```

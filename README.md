![Monero Minning](https://raw.githubusercontent.com/giansalex/monero-miner-docker/master/assets/monero-docker-isolated.png)

# Monero Miner on Docker Alpine
[![Docker Build Status](https://img.shields.io/docker/cloud/build/giansalex/monero-miner.svg)](https://hub.docker.com/r/giansalex/monero-miner/) ![Docker downloads](https://img.shields.io/docker/pulls/giansalex/monero-miner.svg?label=downloads) ![Image size](https://img.shields.io/docker/image-size/giansalex/monero-miner)

Image of latest [XMRig](https://github.com/xmrig/xmrig) version, built on Alpine.

## Run

For easy start, with default configuration.

```sh
docker run -d --restart=always giansalex/monero-miner
```

Use your own configuration.

- Create your [wallet](https://mymonero.com/)
- Choose a [pool](http://moneropools.com/) (default: `supportXMR`)
- Run container

```sh
docker run -d -e WALLET="{YOUR_WALLET_ID}" giansalex/monero-miner
```

|Environment       |     Description      |
|------------------|----------------------|
|WALLET            | Wallet Address       |
|POOL              | URL of mining server |
|WORKER_NAME       | Worker name          |

**Advanced**

You can customize [xmrig options](https://xmrig.com/docs/miner/command-line-options).
```sh
docker run -d giansalex/monero-miner /xmr/xmrig \
     -o pool.supportxmr.com:3333 \
     -u <YOUR_WALLET> \
     -k  \
     --cpu-priority=2
```

### Miner Tools
- [Find my hashrate](https://xmrig.com/benchmark)
- [Network info (hashrate, blocks, rewards)](https://bitinfocharts.com/monero/)
- [Most Popular Hardware for Monero Mining](https://monerobenchmarks.info/list.php)
- [Optimize CPU minning performance](https://www.nicehash.com/blog/post/how-to-optimize-cpu-mining-performance-for-monero-random-x)
- [XMRig configuration wizard](https://xmrig.com/wizard)
- [Profit Calculator](https://www.coincalculators.io/coin/monero)
- [Mining Reward Estimates](https://www.coinwarz.com/mining/monero/calculator)
- [Compare CPU hardware hashrate](https://monerobenchmarks.info/cpuVScpu.php)

### Donate

XMR Address: `49FzQ7CxFxLQsYNHnGJ8CN1BgJaBvr2FGPEiFVcbJ7KsWDRzSxyN8Sq4hHVSYehjPZLpGe26cY8b7PShd7yxtZcrRjz6xdT`

![](./assets/wallet-qr.png) 

![Monero Logo](https://web.getmonero.org/img/monero-logo.png)

# Monero Miner on Docker Alpine
[![Docker Build Status](https://img.shields.io/docker/cloud/build/giansalex/monero-miner.svg?style=flat-square)](https://hub.docker.com/r/giansalex/monero-miner/) [![](https://images.microbadger.com/badges/image/giansalex/monero-miner.svg)](https://microbadger.com/images/giansalex/monero-miner "Get your own image badge on microbadger.com")

Image of latest [xmrig](https://github.com/xmrig/xmrig) version, built on Alpine.

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
- [Profit Calculator](https://www.coincalculators.io/coin/monero)
- [Most Popular Hardware for Monero Mining](https://monerobenchmarks.info/list.php)
- [Mining Reward Estimates](https://www.coinwarz.com/mining/monero/calculator)

### Donate

- XMR: `49FzQ7CxFxLQsYNHnGJ8CN1BgJaBvr2FGPEiFVcbJ7KsWDRzSxyN8Sq4hHVSYehjPZLpGe26cY8b7PShd7yxtZcrRjz6xdT`

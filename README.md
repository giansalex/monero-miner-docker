![Monero Logo](https://web.getmonero.org/img/monero-logo.png)

# Monero Miner with Docker

Image of latest [xmrig](https://github.com/xmrig/xmrig) version, built on Alpine.


## Run

For easy start, with default configurations.

```sh
docker run -d --restart=always giansalex/monero-miner
```

If you have already create your wallet:

```sh
docker run -d -e WALLET=xxxxxxxxxxx giansalex/monero-miner
```

**Advanced**

You can customize [xmrig options](https://github.com/xmrig/xmrig#command-line-options)
```sh
docker run -d giansalex/monero-miner \
     -o pool.supportxmr.com:3333 \
     -u <YOUR_WALLET> \
     -k  \
     --cpu-priority=2
```

### Donate

- XMR: `49FzQ7CxFxLQsYNHnGJ8CN1BgJaBvr2FGPEiFVcbJ7KsWDRzSxyN8Sq4hHVSYehjPZLpGe26cY8b7PShd7yxtZcrRjz6xdT`
- BTC: `bc1qduptk4pne2qnjemk075ay47rq6glwyp52gu473`
- ETH: `0xdFF11Ac79830AC5089Dbf12fb3aB93D632314E15` (or ERC-20)
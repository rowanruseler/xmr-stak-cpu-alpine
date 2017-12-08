###### based on [fireice-uk/xmr-stak]
# XMR-Stak - CPU only - Alpine container

#### Table of Contents

1. [Overview][Overview]
2. [Description][Module description]
3. [Setup][Setup]
    * [Environment variables][]
    * [httpd][]
4. [Usage][Usage]
    * [Docker Compose][]

## Overview

XMR-Stak is a universal Stratum pool miner. This container is Alpine based and supports only CPUs to mine the crypto currency Monero and Aeon.

## Notices

This container is build and has been tested for:

* [fireice-uk/xmr-stak/releases] v2.0.0

## Description

Docker Alpine build for XMR-Stak CPU only mining, has all configuration settings available as environment variables.

## Setup

### Environment variables

Following environment variables are required:

* WALLET_ADDRESS        - Your wallet, or pool login.

Then, run the commands to build and run the Docker image:

``` bash
docker build -t xmr-stak-cpu-alpine .
docker run -dit --name my-running-miner -e WALLET_ADDRESS=45yZKa xmr-stak-cpu-alpine
```

Following environment variables are optional:

* POOL_ADDRESS          - Default: pool.supportxmr.com:333
* POOL_PASSWORD         - Default: x
* USE_NICEHASH          - Default: true
* USE_TLS               - Default: false
* TLS_FINGERPRINT       - Optional
* POOL_WEIGHT           - Default: 1
* CURRENCY              - Default: monero
* CALL_TIMEOUT          - Default: 10
* RETRY_TIME            - Default: 30
* GIVEUP_LIMIT          - Default: 0
* VERBOSE_LEVEL         - Default: 4
* PRINT_MOTD            - Default: true
* H_PRINT_TIME          - Default: 60
* AES_OVERRIDE          - Default: null
* USE_SLOW_MEMORY       - Default: warn
* TLS_SECURE_ALGO       - Default: true
* DAEMON_MODE           - Default: false
* FLUSH_STDOUT          - Default: true
* OUTPUT_FILE           - Optional
* HTTPD_PORT            - Optional
* HTTP_LOGIN            - Optional
* HTTP_PASS             - Optional
* PREFER_IPV4           - Default: true
* CUSTOM_CPU            - Default: false
* THREADS               - Default: 1
* NO_PREFETCH           - Default: true
* LOW_POWER_MODE        - Default: false
* AFFINE_TO_CPU         - Default: true

### httpd

To enable the built-in web server:

* HTTPD_PORT

Then, run the commands to run the Docker image:

``` bash
docker run -dit --name my-running-miner -e WALLET_ADDRESS=45yZKa -e HTTPD_PORT=8080 -p 8080:8080 xmr-stak-cpu-alpine
```

## Usage

Quick way to build your custom build, is to modify `run.sh` and then `export` environment variables.

```
#!/bin/sh
export WALLET_ADDRESS=45yZKa
export CUSTOM_CPU=true
export USE_SLOW_MEMORY=no_mlck

...

exec xmr-stak
```

### Docker Compose

Example:

```
xmr-stak-cpu-alpine:
  restart: on-failure
  image: xmr-stak-cpu-alpine
  ports:
    - 8080:8080
  environment:
    WALLET_ADDRESS: 45yZKa
    HTTPD_PORT: 8080
```

[Overview]: #overview
[Description]: #description
[Setup]: #setup
[Usage]: #usage

[fireice-uk/xmr-stak]: https://github.com/fireice-uk/xmr-stak
[fireice-uk/xmr-stak/releases]: https://github.com/fireice-uk/xmr-stak/releases

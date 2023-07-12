#!/bin/sh
set -e

DATADIR=/root/.ethereum/geth/LOCK
if [ ! -f "$DATADIR" ]; then
    mkdir -p /root/.ethereum/geth
    cp -r /datadir/* /root/.ethereum/geth/
fi

exec geth $@
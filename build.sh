#!/bin/sh

docker build \
    -f raw.dockerfile \
    -t mininet:v2.2.2 \
    --build-arg PACKAGES="$(cat installed.txt)" \
    . 
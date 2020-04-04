#!/bin/sh

docker build \
    -f Dockerfile \
    -t mininet:v2.2.2 \
    --build-arg PACKAGES="$(cat installed.txt)" \
    . 
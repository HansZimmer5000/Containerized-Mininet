#!/bin/sh

source ./current_version
docker build \
    -f Dockerfile \
    -t mn \
    -t hanszimmer5000/mininet:latest \
    -t hanszimmer5000/mininet:$current_version \
    .
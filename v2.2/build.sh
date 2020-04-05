#!/bin/sh

source ./current_version

help(){
    echo "
This script helps to interact with the git and docker repository.
Usage:
    -h | help:      Print this usage
    -- DOCKER --
    build (default):Build the docker image with different tags
    test:           Test the current build docker image with the basic 'pingall' mininet test
    push:           Push the docker image to Docker Hub
    -- GIT --
    push:           Tag and push master
"
}

build_image(){
    docker build \
        -f Dockerfile \
        -t mn \
        -t hanszimmer5000/mininet:latest \
        -t hanszimmer5000/mininet:$current_version \
        .
}

test_image(){
    docker run --rm --privileged hanszimmer5000/mininet:$current_version mn --test pingall
}

push_image(){
    docker push hanszimmer5000/mininet:$current_version
}

tag_and_push(){
    tag_name="v2.2"
    git tag $tag_name $tag_name^{} -f -a -m "Mininet v2.2"
    git push
}

case "$1" in
    "build"|"") 
        build_image
        ;;
    "test")
        test_image
        ;;
    "upload")
        push_image
        ;;
    "push")
        tag_and_push
        ;;
    *|"-h"|"help")
        help
        ;;
esac

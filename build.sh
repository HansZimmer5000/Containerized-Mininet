#!/bin/sh

source ./current_version

build_image(){
    docker build \
        -f Dockerfile \
        -t mn \
        -t hanszimmer5000/mininet:latest \
        -t hanszimmer5000/mininet:$current_version \
        .
}

test_image(){
    docker run --rm --privileged hanszimmer5000/mininet:v2.2.2-latest mn --test pingall
}

push_image(){
    docker push hanszimmer5000/mininet:$current_version
}

merge_branches(){
    git checkout master
    git merge dev
    git push
    git checkout dev
}

case $1; do
    "build"|"") 
        build_image
        ;;
    "test")
        test_image
        ;;
    "push")
        push
        ;;
    "merge")
        merge_branches
        ;;
    *)
        echo "Param not known: $1"
        ;;
esac

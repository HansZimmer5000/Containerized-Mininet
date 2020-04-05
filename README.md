# Containerized-Mininet
Mininet in Version 2.2.2 in a Docker Image

## Execution

Execute the following command to test if the images works with the basic built-in test, you may want to add `-v debug` at the end for more output.
```shell
docker run --privileged hanszimmer5000/mininet:v2.2.2-latest mn --test pingall
```

Unfortunately the `--privileged` is not mandatory. Which special rights mininet uses, I haven't looked up yet.


# Containerized-Mininet

Basic Mininet in a Docker Image.

## Execution

Execute the following command to test if the images works with the basic built-in test, you may want to add `-v debug` at the end for more output.
```shell
docker run --privileged hanszimmer5000/mininet mn --test pingall
```

Unfortunately the `--privileged` is not mandatory. Which special rights mininet uses, I haven't looked up yet.

## Docker Image Versioning

For the latest image version use `:latest` tag.
The `:v2.2.2-v1.1` means this is Mininet v2.2.2 in image major version 1 and minor version 1 (like used for PostgreSQL versioning). 
- Major updates include new functionalities for the user.
- Minor updates include small fixes and upgrades for the build process.

Currently this repository only has Mininet v2.2.2. This may change in the future, so beware if you are using `:latest` tag only, as in common releases Mininet could be in a different version than v2.2.2.

# Containerized-Mininet

Basic Mininet in a Docker Image.

## Execution

Execute the following command to test if the images works with the basic built-in test, you may want to add `-v debug` at the end for more output.
```shell
docker run --privileged hanszimmer5000/mininet mn --test pingall
```

Unfortunately the `--privileged` is not mandatory. Which special rights mininet uses, I haven't looked up yet.

## Docker Image Versioning

Beware if you are using `:latest` tag or omitting tags, since this could lead to Mininet v2.2 or v2.3. Better use `:v2.2-latest` or `v2.3-latest` respectively to be sure.

For the latest image version use `:latest` tag.
The `:v2.2.2-v1.1` means this is Mininet v2.2.2 in image major version 1 and minor version 1 (like used for PostgreSQL versioning). 
- Major updates include new functionalities for the user.
- Minor updates include small fixes and upgrades for the build process.


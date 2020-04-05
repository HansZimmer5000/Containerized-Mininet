# Containerized-Mininet

Basic Mininet in a Docker Image.
Currently supported are the current Mininet release (v2.2.2) and the latest (05. April 2020) tagged commit (v2.3.0d6).

## Execution

Execute the following command to test if the images works with the basic built-in test, you may want to add `-v debug` at the end for more output.
```shell
docker run --privileged hanszimmer5000/mininet:v2.2-latest mn --test pingall
```

Unfortunately the `--privileged` is not mandatory. Which special rights mininet uses, I haven't looked up yet.

## Docker Image Versioning


List of image versions:
- latest: Latest version of this image running Mininet (currently v2.3.0d6)
- v2.2-latest: Latest version of this image running Mininet (currently v2.2.2)
- v2.3-latest: Latest version of this image running Mininet (currently v2.3.0d6)
- \<Mininet-Version>-\<Image-Version>: Specific tags for specific mininet versions and image versions. 

As example, the `:v2.2.2-v1.0` means this is Mininet v2.2.2 in image major version 1 and minor version 0 (like used for PostgreSQL versioning). 
- Major updates include new functionalities for the user.
- Minor updates include small fixes and upgrades for the build process.

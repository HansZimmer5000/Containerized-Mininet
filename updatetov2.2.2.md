# Update of the debian image to v2.2.2

Install packages list is exclusive "mininet", this will be installed via git.

```shell
# Start Container
docker run \
    -it \
    --rm \
    --privileged \
    -v /home/hanszimmer/repositories/sdn_on_acids/mininet_docker/mininet-docker/mod_install.sh:/mod_install.sh \
    -v /home/hanszimmer/repositories/sdn_on_acids/mininet_docker/mininet-docker/installed.txt:/install.txt \
    debian:stretch-slim \
    /bin/bash

# Install files
(apt-get update; packages=$(cat install.txt); apt-get install --no-install-recommends -y $packages) 1> /dev/null

# Prepare mininet Install
rm -rf /home/openflow/; mkdir /usr/share/man/man1; apt-get install --no-install-recommends -y git ca-certificates sudo patch apt-utils 1>/dev/null

# Install mininet
(cd /home/; git clone https://github.com/mininet/mininet.git; cd mininet; git checkout 2.2.2; cp /mod_install.sh /home/mininet/util/install.sh; /home/mininet/util/install.sh -fnv) 1> /dev/null

## Start mininet
service openvswitch-switch start
ovs-vsctl set-manager ptcp:6640

mn --test pingall -v debug
```



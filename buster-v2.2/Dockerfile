FROM debian:buster-slim

LABEL maintainer="Michael Müller (michael.mueller2@haw-hamburg.de)"

ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && \
    apt-get install \
        --no-install-recommends \
        --no-install-suggests \
        -y \
        apt-utils ca-certificates cgroup-bin cgroup-tools cpp curl fontconfig-config fonts-dejavu-core git git-man iperf iproute2 iputils-ping kmod libapt-inst2.0 libatomic1 libbsd0 libcap2 libcgroup1 libcurl4 libcurl3-gnutls libelf1 liberror-perl libexpat1 libffi6 libfontconfig1 libfreetype6 libgmp10 libgnutls30 libgpm2 libgssapi-krb5-2 libhogweed4 libice6 libidn11 libidn2-0 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3 libkrb5support0 libldap-2.4-2 libldap-common libmnl0 libmpc3 libncurses5 libnettle6 libnghttp2-14 libp11-kit0 libpcap0.8 libpng16-16 libpsl5 libpython-stdlib libpython2.7-minimal libpython2.7-stdlib libreadline7 librtmp1 libsasl2-2 libsasl2-modules-db libsm6 libsqlite3-0 libssh2-1 libssl1.1 libtasn1-6 libutempter0 libwrap0 libx11-6 libx11-data libxau6 libxaw7 libxcb1 libxcursor1 libxdmcp6 libxext6 libxfixes3 libxft2 libxi6 libxinerama1 libxmu6 libxmuu1 libxpm4 libxrandr2 libxrender1 libxt6 libxxf86vm1 mime-support net-tools netbase openssl openvswitch-common openvswitch-switch patch perl procps python python-minimal python-pkg-resources python-six python2.7 python2.7-minimal readline-common socat sudo tcpdump telnet ucf uuid-runtime wireshark x11-common x11-xserver-utils xbitmaps xterm xxd

# Prepare Mininet Install
RUN rm -rf /home/openflow/ && \
    mkdir /usr/share/man/man1

# Install Mininet from git
RUN git clone https://github.com/mininet/mininet.git /home/mininet/
WORKDIR /home/mininet/
RUN git checkout 2.2.2
COPY mod_install.sh /home/mininet/util/install.sh
RUN chmod +x /home/mininet/util/install.sh && \
     /home/mininet/util/install.sh -fnv

# Prepare Start
EXPOSE 6633 6653 6640

COPY entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh

ENTRYPOINT [ "/home/entrypoint.sh" ]

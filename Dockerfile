FROM debian:stretch-slim

LABEL maintainer="Michael Müller (michael.mueller2@haw-hamburg.de)"

# Install packages, this list includes all packages neccessary but a lot of them are already installed in the base image.
RUN apt-get update && \
    apt-get install \
        --no-install-recommends \
        -y \
        adduser apt base-files base-passwd bash bsdutils cgroup-bin cgroup-tools coreutils cpp cpp-6 curl dash debconf debian-archive-keyring debianutils diffutils dpkg e2fslibs e2fsprogs findutils fontconfig-config fonts-dejavu-core gcc-6-base gpgv grep gzip hostname init-system-helpers iperf iproute2 iputils-ping kmod libacl1 libapt-pkg5.0 libatomic1 libattr1 libaudit-common libaudit1 libblkid1 libbsd0 libbz2-1.0 libc-bin libc6 libcap-ng0 libcap2 libcgroup1 libcomerr2 libcurl3 libdb5.3 libdebconfclient0 libelf1 libexpat1 libfdisk1 libffi6 libfontconfig1 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgpm2 libgssapi-krb5-2 libhogweed4 libice6 libidn11 libidn2-0 libisl15 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3 libkrb5support0 libldap-2.4-2 libldap-common liblz4-1 liblzma5 libmnl0 libmount1 libmpc3 libmpfr4 libncurses5 libncursesw5 libnettle6 libnghttp2-14 libp11-kit0 libpam-modules libpam-modules-bin libpam-runtime libpam0g libpcap0.8 libpcre3 libpng16-16 libprocps6 libpsl5 libpython-stdlib libpython2.7-minimal libpython2.7-stdlib libreadline7 librtmp1 libsasl2-2 libsasl2-modules-db libselinux1 libsemanage-common libsemanage1 libsepol1 libsm6 libsmartcols1 libsqlite3-0 libss2 libssh2-1 libssl1.0.2 libssl1.1 libstdc++6 libsystemd0 libtasn1-6 libtinfo5 libudev1 libunistring0 libustr-1.0-1 libutempter0 libuuid1 libwrap0 libx11-6 libx11-data libxau6 libxaw7 libxcb1 libxcursor1 libxdmcp6 libxext6 libxfixes3 libxft2 libxi6 libxinerama1 libxmu6 libxmuu1 libxpm4 libxrandr2 libxrender1 libxt6 libxxf86vm1 login lsb-base mawk mime-support mount multiarch-support ncurses-base ncurses-bin net-tools netbase openssl openvswitch-common openvswitch-switch passwd perl-base procps python python-minimal python-pkg-resources python-six python2.7 python2.7-minimal readline-common sed sensible-utils socat sysvinit-utils tar tcpdump telnet tzdata ucf util-linux uuid-runtime x11-common x11-xserver-utils xbitmaps xterm xxd zlib1g git ca-certificates sudo patch apt-utils 

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

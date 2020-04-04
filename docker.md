# Docker run / file

```shell
# Raw
docker run -ti --rm --privileged --publish-all raw_mn 


# From https://github.com/iwaseyusuke/docker-mininet/blob/master/Dockerfile
docker run -it --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             iwaseyusuke/mininet
```

``` shell
##!/bin/sh

# Not yet installed: autoconf automake ca-certificates libtools 
# Not yet started: service openvswitch-switch start
# ??? ovs-vsctl set-manager ptcp:6640

# From install.sh:  distro-info-data libmpdec2 libpython3-stdlib libpython3.6-minimal libpython3.6-stdlib python3 python3-minimal python3.6 python3.6-minimal
# 2.0.3.d06 install.sh: binutils binutils-common binutils-x86-64-linux-gnu blt cgroup-bin cgroup-tools cpp cpp-7 dbus dmsetup ethtool gcc gcc-7 gcc-7-base gir1.2-glib-2.0 help2man iperf javascript-common libapparmor1 libargon2-0 libasan4 libatomic1 libbinutils libc-dev-bin libc6-dev libcc1-0 libcgroup1 libcilkrts5 libcryptsetup12 libdbus-1-3 libdevmapper1.02.1 libgcc-7-dev libgirepository-1.0-1 libglib2.0-0 libglib2.0-data libgomp1 libicu60 libip4tc0 libisl19 libitm1 libjs-jquery libjs-sphinxdoc libjs-underscore libjson-c3 liblocale-gettext-perl liblsan0 libmpc3 libmpfr6 libmpx2 libnss-systemd libpam-systemd libquadmath0 libtcl8.6 libtk8.6 libtsan0 libubsan0 libwrap0 libxml2 libxss1 linux-libc-dev make manpages manpages-dev ncurses-term networkd-dispatcher openssh-server openssh-sftp-server pep8 psmisc pycodestyle pyflakes pyflakes3 pylint python-astroid python-backports.functools-lru-cache python-concurrent.futures python-configparser python-egenix-mxdatetime python-egenix-mxtools python-enum34 python-isort python-lazy-object-proxy python-logilab-common python-mccabe python-pexpect python-pkg-resources python-ptyprocess python-pyflakes python-setuptools python-singledispatch python-tk python-wrapt python3-certifi python3-chardet python3-dbus python3-gi python3-idna python3-pkg-resources python3-pycodestyle python3-pyflakes python3-requests python3-six python3-urllib3 shared-mime-info socat ssh ssh-import-id systemd systemd-sysv telnet tk8.6-blt2.5 tzdata wget xdg-user-dirs
## continue with wireshark?
#  adwaita-icon-theme at-spi2-core dconf-gsettings-backend dconf-service fontconfig glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas gstreamer1.0-plugins-base gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme iso-codes libasound2 libasound2-data libasyncns0 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0 libavahi-client3 libavahi-common-data libavahi-common3 libc-ares2 libcairo-gobject2 libcairo2 libcdparanoia0 libcolord2 libcroco3 libcups2 libdatrie1 libdconf1 libdouble-conversion1 libegl-mesa0 libegl1 libepoxy0 libevdev2 libflac8 libgbm1 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgraphite2-3 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-bin libgtk-3-common libgudev-1.0-0 libharfbuzz0b libinput-bin libinput10 libjbig0 libjpeg-turbo8 libjpeg8 libjson-glib-1.0-0 libjson-glib-1.0-common liblcms2-2 liblua5.2-0 libmaxminddb0 libmtdev1 libnl-3-200 libnl-genl-3-200 libnl-route-3-200 libogg0 libopus0 liborc-0.4-0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libproxy1v5 libpulse0 libqgsttools-p1 libqt5core5a libqt5dbus5 libqt5gui5 libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 libqt5network5 libqt5opengl5 libqt5printsupport5 libqt5svg5 libqt5widgets5 librest-0.7-0 librsvg2-2 librsvg2-common libsbc1 libsmi2ldbl libsnappy1v5 libsndfile1 libsoup-gnome2.4-1 libsoup2.4-1 libspandsp2 libssh-gcrypt-4 libthai-data libthai0 libtheora0 libtiff5 libvisual-0.4-0 libvorbis0a libvorbisenc2 libwacom-bin libwacom-common libwacom2 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libwireshark-data libwireshark11 libwiretap8 libwscodecs2 libwsutil9 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shm0 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xkb1 libxcursor1 libxkbcommon-x11-0 libxkbcommon0 qt5-gtk-platformtheme qttranslations5-l10n tshark ubuntu-mono wireshark wireshark-common wireshark-qt xkb-data
# continue for cbench: libconfig-dev libconfig-doc libconfig9 libpcap-dev libpcap0.8-dev libpci-dev libpci3 libsensors4-dev libsnmp-base libsnmp-dev libsnmp30 libssl-dev libudev-dev libwrap0-dev zlib1g-dev

apt-get update 1> /dev/null; \
apt-get install -y apt-utils curl git sudo net-tools iproute2 iputils-ping openvswitch-switch openvswitch-testcontroller tcpdump xterm openssh-client 1> /dev/null; \
git clone git://github.com/mininet/mininet;\
cd mininet; \
git tag; \
read; \
git checkout -b 2.2.2 2.2.2; \
read; \
./util/install.sh; \
source ~/.bashrc; \
mn --test pingall

```
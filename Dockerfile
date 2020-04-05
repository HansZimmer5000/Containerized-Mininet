FROM debian:stretch-slim

LABEL maintainer="Michael Müller (michael.mueller2@haw-hamburg.de)"

ARG PACKAGES

# Install packages
RUN apt-get update && \
    apt-get install \
        --no-install-recommends \
        -y \
        $PACKAGES

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

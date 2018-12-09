FROM docker.io/ubuntu:trusty

LABEL net.skyplabs.maintainer-name="Paul-Emmanuel Raoul"
LABEL net.skyplabs.maintainer-email="skyper@skyplabs.net"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y ppa:terry.guo/gcc-arm-embedded \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6D1D8367A3421AFB \
    && apt-get update \
    && apt-get install -y --no-install-recommends git gcc-arm-none-eabi srecord make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone https://github.com/Seeed-Studio/mbed_ble.git
WORKDIR /usr/src/mbed_ble
RUN git checkout -b softdevice_v6 origin/softdevice_v6 \
    && find . -type d -exec chmod 777 {} \;
WORKDIR /usr/src/app

ENTRYPOINT ["make"]

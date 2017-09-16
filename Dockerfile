FROM docker.io/ubuntu:trusty
MAINTAINER Paul-Emmanuel Raoul <skyper@skyplabs.net>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:terry.guo/gcc-arm-embedded \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6D1D8367A3421AFB \
    && apt-get update \
    && apt-get install -y git gcc-arm-none-eabi srecord make

WORKDIR /usr/src
RUN git clone https://github.com/Seeed-Studio/mbed_ble.git
WORKDIR /usr/src/mbed_ble
RUN git checkout -b softdevice_v6 origin/softdevice_v6 \
    && find . -type d -exec chmod 777 {} \;
WORKDIR /usr/src/app

ENTRYPOINT ["make"]

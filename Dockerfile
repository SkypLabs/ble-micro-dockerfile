FROM docker.io/ubuntu:trusty
MAINTAINER skyper@skyplabs.net

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:terry.guo/gcc-arm-embedded \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6D1D8367A3421AFB \
    && apt-get update \
    && apt-get install -y git gcc-arm-none-eabi srecord make

RUN useradd -m dev
USER dev
WORKDIR /home/dev
RUN git clone https://github.com/Seeed-Studio/mbed_ble.git
WORKDIR /home/dev/mbed_ble
RUN git checkout -b softdevice_v6 origin/softdevice_v6 \
    && mkdir app
WORKDIR /home/dev/mbed_ble/app

ENTRYPOINT ["make"]

FROM ubuntu:trusty
MAINTAINER skyper@skyplabs.net

RUN apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository -y ppa:terry.guo/gcc-arm-embedded \
	&& apt-get update \
	&& apt-get install -y git gcc-arm-none-eabi srecord make

RUN useradd -m dev \
	&& su -c 'cd \
		&& git clone https://github.com/Seeed-Studio/mbed_ble.git \
		&& cd mbed_ble \
		&& git checkout -b softdevice_v6 origin/softdevice_v6 \
		' dev


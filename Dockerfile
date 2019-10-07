FROM ubuntu:18.04

RUN apt update && \
	apt install -y git gcc-arm-none-eabi ninja-build python3 python3-pip && \
	pip3 install meson && \
	cd /usr/src && \
	git clone https://github.com/keith-packard/picolibc.git && \
	cd picolibc && \
	mkdir build-arm-none-eabi && \
	cd build-arm-none-eabi && \
	../do-arm-configure && \
	ninja && \
	ninja install


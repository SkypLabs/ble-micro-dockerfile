# Introduction

This image provides a development environment to build software for the [Seeed Studio's BLE Micro][1].

# How to

    docker pull skyplabs/ble-micro
    docker run --name <name> -it -v <local path>:/home/dev/mbed_ble/<your application name> skyplabs/ble-micro /bin/bash
    su dev
    cd ~/mbed_ble/<your application name>
    make

The *local path* designs the folder on your host system which holds the source code of your application.

  [1]: http://www.seeedstudio.com/depot/Seeed-Micro-BLE-Module-w-CortexM0-Based-nRF51822-SoC-p-1975.html

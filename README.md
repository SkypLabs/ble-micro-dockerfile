# BLE Micro Development Environment

[![Build Status](https://travis-ci.org/SkypLabs/ble-micro-dockerfile.svg)](https://travis-ci.org/SkypLabs/ble-micro-dockerfile) [![Code Coverage](https://api.codacy.com/project/badge/Grade/bdffc169e5e749a0ae7bdbfc40cf21a9)](https://www.codacy.com/app/skyper/ble-micro-dockerfile?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=SkypLabs/ble-micro-dockerfile&amp;utm_campaign=Badge_Grade)

This image provides a development environment to build software for the [Seeed Studio's BLE Micro][ble-micro].

## How to

    docker run --rm -u $(id -u):$(id -g) -v <local path>:/usr/src/app docker.io/skyplabs/ble-micro

*local path* refers to the folder on your host system which holds the source code of your application and containing a `Makefile`.

If you already are in this folder :

    docker run --rm -u $(id -u):$(id -g) -v $(pwd):/usr/src/app docker.io/skyplabs/ble-micro

And if you want to specify a *target name* to **make** :

    docker run --rm -u $(id -u):$(id -g) -v $(pwd):/usr/src/app docker.io/skyplabs/ble-micro <target name>

## License

[MIT][MIT]

 [ble-micro]: https://www.seeedstudio.com/depot/Seeed-Micro-BLE-Module-w-CortexM0-Based-nRF51822-SoC-p-1975.html
 [MIT]: https://opensource.org/licenses/MIT

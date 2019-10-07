# picolibc-docker
Picolibc Docker build environment for arm-none-eabi

Creates a Docker image which can be used to build ARM embedded images using Keith Packard's Picolibc (https://github.com/keith-packard/picolibc) library.

## How to use

```bash
git clone https://github.com/philpem/picolibc-docker-arm
docker build -t picolibc-arm:latest picolibc-docker-arm
```

Then create a suitable Dockerfile which inherits from the `picolibc-arm:latest` image.

Alternatively you can use `docker run` and specify your build commands on the Docker command line:

```bash
# assumes files are in $PWD/test, and the C file is test.c -- output is in /test/test.elf
docker run -v $PWD/test:/test picolibc-arm:latest bash -c 'cd /test; arm-none-eabi-gcc -o test.elf -specs=picolibc.specs test.c'
```


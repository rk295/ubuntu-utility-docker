ubuntu-utility-docker
=====================

[![Build and Push Docker Image](https://github.com/rk295/ubuntu-utility-docker/workflows/Build%20and%20Push%20Docker%20Image/badge.svg)](https://github.com/rk295/ubuntu-utility-docker/actions)
[![Docker Image](https://img.shields.io/badge/docker-ghcr.io%2Frk295%2Fubuntu--utility--docker%3Alatest-blue?logo=docker)](https://github.com/rk295/ubuntu-utility-docker/pkgs/container/ubuntu-utility-docker)

This container is meant to make it easier for me to debug issues inside Kubernetes clusters. It might have uses in other clustered environments, for example Swarm or AWS ECS.

It is simply a ubuntu base container with some utilities installed on top, currently the list is:

* `apt-transport-https`
* `awscli` (via pipx)
* `curl`
* `dnsutils`
* `git`
* `google-cloud-cli`
* `gpg`
* `helm`
* `htop`
* `jq`
* `lsof`
* `netcat-traditional`
* `nmap`
* `pipx`
* `postgresql-client`
* `python3` & `python3-pip`
* `ssh`
* `tcpflow`
* `vim`
* `yq`

It is best run with some never exiting command like `tail -f /dev/null`.

## Building

Simply run `docker build .` from inside this directory:

    $ docker build -t ghcr.io/rk295/ubuntu-utility-docker .
    Sending build context to Docker daemon 33.79 kB
    Step 1 : FROM ubuntu
     ---> ebcd9d4fca80
    Step 2 : RUN apt-get update
     ---> Running in b6705c6e8caa
     < lines removed for clariy>
        Successfully built 2e6869e49ed9
    $

## Running

Run with something like this:

    $ docker run ghcr.io/rk295/ubuntu-utility-docker tail -f /dev/null

This will block, so it isn't useful from the shell, but is inside clustered environments.

If you want to run it locally substitute the `tail` with a shell:

    $ docker run --rm -it ghcr.io/rk295/ubuntu-utility-docker /bin/bash

Thats all!

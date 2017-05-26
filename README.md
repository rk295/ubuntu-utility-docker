ubuntu-utility-docker
=====================

This docker is meant to make it easier for me to debug issues inside Kubernetes clusters. It might have uses in other clustered environments, for example Swarm or AWS ECS.

It is simply a ubuntu base container with some utilities installed on top, currently the list is:

* `vim`
* `curl`
* `htop`
* `netcat`
* `lsof`
* `ssh `
* `dnsutils`

It is best run with some never exiting command like `tail -f /dev/null`.

## Building

Simply run `docker build .` from inside this directory:

    $ docker build -t rk295/ubuntu-utility-docker .
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

    $ docker run rk295/ubuntu-utility-docker tail -f /dev/null

This will block, so it isn't useful from the shell, but is inside clustered environments.

If you want to run it locally substitute the `tail` with a shell:

    $ docker run --rm -it rk295/ubuntu-utility-docker /bin/bash

Thats all!

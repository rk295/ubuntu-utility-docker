FROM ubuntu

MAINTAINER Robin Kearney <robin@kearney.co.uk>

RUN apt-get update

RUN apt-get install -y vim curl htop netcat lsof ssh dnsutils nmap tcpflow

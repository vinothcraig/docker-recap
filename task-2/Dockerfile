FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install iproute2
RUN apt-get install docker.io apparmor apparmor.utils 
COPY ./src/. .

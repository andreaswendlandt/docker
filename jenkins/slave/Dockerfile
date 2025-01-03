FROM ubuntu:22.04
USER root
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y shellcheck && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*

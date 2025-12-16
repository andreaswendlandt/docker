FROM debian:trixie
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*
ENV HTTP_PROXY="http://squid:3128/"
ENV HTTPS_PROXY="http://squid:3128/"
ENV http_proxy="http://squid:3128/"
ENV https_proxy="http://squid:3128/"
CMD /bin/bash

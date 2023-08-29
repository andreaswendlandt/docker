# dockerfile cronguard daemon
FROM ubuntu:22.04
LABEL maintainer "andreaswendlandt.79@googlemail.com"
RUN mkdir -p /opt/cronguard && \
    apt-get update && \
    apt-get install -y mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY cronguard.sh /opt/cronguard
COPY db.inc.sh /opt/cronguard
COPY start_cronguard.sh /opt/cronguard
CMD ["/opt/cronguard/start_cronguard.sh"]

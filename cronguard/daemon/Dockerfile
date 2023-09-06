# dockerfile cronguard daemon
FROM alpine:latest
LABEL maintainer "andreaswendlandt.79@googlemail.com"
RUN mkdir -p /opt/cronguard && \
    apk add --no-cache bash mysql-client
COPY cronguard.sh /opt/cronguard
COPY db.inc.sh /opt/cronguard
COPY start_cronguard.sh /opt/cronguard
CMD ["/opt/cronguard/start_cronguard.sh"]

# dockerfile cronguard webserver
FROM ubuntu:22.04
LABEL maintainer "andreaswendlandt.79@googlemail.com"
ENV TZ="Europe/Berlin" \
APACHE_RUN_USER=www-data \
APACHE_RUN_GROUP=www-data \
APACHE_LOG_DIR=/var/log/apache2
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
        apache2 \
        apache2-bin \
        apache2-data \
        apache2-utils \
        libapache2-mod-dnssd \
        libapache2-mod-php7.2 \
        php7.2 \
        php7.2-cli \
        php7.2-common \
        php7.2-json \
        php7.2-mysql \
        php7.2-opcache \
        php7.2-readline && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY cronguard.php /var/www/html
COPY db.inc.php /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

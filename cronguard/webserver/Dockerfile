# dockerfile cronguard webserver
FROM php:7.2.34-apache
LABEL maintainer "andreaswendlandt.79@googlemail.com"
ENV TZ="Europe/Berlin" \
APACHE_RUN_USER=www-data \
APACHE_RUN_GROUP=www-data \
APACHE_LOG_DIR=/var/log/apache2
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    docker-php-ext-install mysqli
COPY cronguard.php /var/www/html
COPY db.inc.php /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

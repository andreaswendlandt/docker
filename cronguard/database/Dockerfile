# dockerfile cronguard database
FROM mysql
MAINTAINER andreaswendlandt.79@googlemail.com

ENV MYSQL_ROOT_PASSWORD=s3cr3t
ADD cronguard.sql /docker-entrypoint-initdb.d

EXPOSE 3306

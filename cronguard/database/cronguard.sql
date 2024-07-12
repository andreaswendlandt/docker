CREATE DATABASE cronguard;

USE cronguard;

CREATE TABLE jobs ( jobid INT NOT NULL AUTO_INCREMENT, token CHAR(6), host VARCHAR(50), start_time BIGINT, end_time BIGINT, command VARCHAR(300), action VARCHAR(8), result VARCHAR(7), PRIMARY KEY (jobid) ) ENGINE MyISAM;

CREATE USER 'cronguard'@'%' IDENTIFIED BY 'top_secret';
GRANT ALL ON cronguard.* TO 'cronguard'@'%';

FLUSH PRIVILEGES;

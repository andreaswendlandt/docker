# CRONGUARD - the docker way
## 3 containers are necessary, a database container, a webserver container and a daemon container
## build the images
### the cronguard database image
builds the image based on the latest mysql image
creates the database cronguard with the table jobs and the db user cronguard
run:
```
docker build -t cronguard_database .
```

### the cronguard webserver image
builds the image based on ubuntu 22:04
installs apache2 and php
copies the cronguard.php script and the db.inc.php config file to /var/www/html
starts  apache
run:
``` 
docker build -t cronguard_webserver .
```

### the cronguard daemon
builds the image based on ubuntu 22:04
installs mysql-client
creates the directory /opt/cronguard
copies the daemon script cronguard.sh, the db.inc.sh config file and the start_cronguard.sh start script to /opt/cronguard
run:
```
docker build -t cronguard_daemon .
```

## create the cronguard network
run:
```
docker network create cronguard_net
```

## start the container
### the cronguard database container
run:
```
docker run -d --network=cronguard_net --name cronguard_db cronguard_database
```

### the cronguard webserver container
run:
```
docker run -d --link cronguard_db:cronguard_db --network cronguard_net -p 8080:80 --name cronguard_web cronguard_webserver
```

### the cronguard daemon container
NOTE: you need to create a local directory which can be mounted as a volume to /var/log inside the container
run:
```
mkdir <your_local_log_dir>
docker run -d -v <path_to_your_local_log_dir>/:/var/log --link cronguard_db:cronguard_db --network=cronguard_net --name cronguard_daemon cronguard_daemon
```

## how to use it
copy the client directory to your desired location and adapt the two scripts in it

as the above command for running the cronguard webserver container binds the container port 80 to the port 8080 of the local machine adapt the url.inc.sh file with the url and port where it is running(in the below example it is listening on port 8080 at localhost - and only on that machine reachable)
```
url="http://localhost:8080/cronguard.php"
```
adapt the script cron_wrapper.sh and change the following line according to the location of the url.inc.sh file
```
if ! source url.inc.sh 2>/dev/null; then
```
now whatever you run with the cron_wrapper.sh script will be evaluated by cronguard:
```
./cron_wrapper.sh "command"

./cron_wrapper.sh "script.sh"

./cron_wrapper.sh "command1 | command2 | command3"
```

in case that whatever you run exits with success nothing happens, for everything that finishes not successful you will see a log entry in the file cronguard_error.log(in the log directory you created above)
an example entry:
```
Mon Aug 28 19:07:14 UTC 2023 ERROR, failed Cronjob on andreas-Lenovo-ideapad-120S-11IAP: "sleep 2 | false"
```

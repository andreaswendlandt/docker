# CheckMK 
when you create a checkmk container via docker-compose or docker the username to login to the webgui is cmkadmin, the password you can find after running the following command:
```
docker container logs mymonitoring 
### CREATING SITE 'cmk'
Generating configuration for core (type nagios)...
Precompiling host checks...OK
Adding /opt/omd/sites/cmk/tmp to /etc/fstab.
Going to set TMPFS to off.
Temporary filesystem already mounted
Updating core configuration...
Executing post-create script "01_create-sample-config.py"...OK
Adding /opt/omd/sites/cmk/tmp to /etc/fstab.
Going to set TMPFS to off.
Created new site cmk with version 2.1.0p24.cre.

  The site can be started with omd start cmk.
  The default web UI is available at http://547aa41bf6e3/cmk/

  The admin user for the web applications is cmkadmin with password: SwpeR5Wi
  For command line administration of the site, log in with 'omd su cmk'.
  After logging in, you can change the password for cmkadmin with 'cmk-passwd cmkadmin'.

WARNING: You have to execute 'omd update-apache-config cmk' as root to update and apply the configuration of the system apache.
WARNING: You have to execute 'omd update-apache-config cmk' as root to update and apply the configuration of the system apache.
### STARTING XINETD
 * Starting internet superserver xinetd
   ...done.
### STARTING SITE
Starting agent-receiver...OK
Starting mkeventd...OK
Starting rrdcached...OK
Starting npcd...OK
Starting nagios...OK
Starting apache...OK
Starting redis...OK
Initializing Crontab...OK
Temporary filesystem already mounted
### STARTING CRON
### CONTAINER STARTED
``

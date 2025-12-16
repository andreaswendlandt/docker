# squid
simple docker setup with two containers, a squid proxy server and a web client that uses that proxy for outgoing traffic - package management and web

## start 
```
docker compose up -d
```
## testing
connect to the squid proxy and open the log file 
```
docker exec -it squid /bin/bash
tail -f /var/log/squid/access.log
```
connect to the web client and install the command line browser "lynx"
```
docker exec -it web_client /bin/bash
apt-get update && apt-get install lynx
```
after the successful installation call a website
```
lynx golem.de
```
go back to the squid proxy and watch the logfile, you should see something like that
```
1767472261.707     46 172.18.0.2 TCP_MISS/301 233 GET http://golem.de/ - HIER_DIRECT/77.247.84.129 -
1767472263.907    187 172.18.0.2 TCP_TUNNEL/200 3799 CONNECT golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472266.089    154 172.18.0.2 TCP_TUNNEL/200 3687 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472268.279    168 172.18.0.2 TCP_TUNNEL/200 21312 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472288.249    141 172.18.0.2 TCP_TUNNEL/200 3687 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472290.458    184 172.18.0.2 TCP_TUNNEL/200 21510 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
```

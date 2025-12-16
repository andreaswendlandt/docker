# ansible
simple docker setup that provides 3 container, one as a master with a working ansible environment and two nodes which are
instantly reachable via ansible ping

## build the images and create the container

```
docker-compose build --build-arg SSH_KEY="$(cat ssh/id_ed25519)" --build-arg SSH_KEY_PUB="$(cat ssh/id_ed25519.pub)"
docker-compose up --no-build -d
```

### customizing
just in case you want to user your "own" ssh keys create a pair like the following
```
ssh-keygen -t ed25519
```
and store them in the ssh directory

***note***
if you name the key files differently don't forget to adjust the names in both dockerfiles(and the docker-compose build command)

### testing
connect to the ansible master
```
docker exec -it ansible_master /bin/bash
```
become the ansible user
```
su ansible
```
ping all hosts from the inventory
```
ansible all -m ping -i /etc/ansible/inventories/testing/inventory 

debian_one | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.13"
    },
    "changed": false,
    "ping": "pong"
}
debian_two | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.13"
    },
    "changed": false,
    "ping": "pong"
}
```
docker compose up -d
docker exec -it web_client /bin/bash
docker exex -it squid /bin/sh
apt-get update && apt-get install lynx
tail -f /var/log/squid/access.log
1767472261.707     46 172.18.0.2 TCP_MISS/301 233 GET http://golem.de/ - HIER_DIRECT/77.247.84.129 -
1767472263.907    187 172.18.0.2 TCP_TUNNEL/200 3799 CONNECT golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472266.089    154 172.18.0.2 TCP_TUNNEL/200 3687 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472268.279    168 172.18.0.2 TCP_TUNNEL/200 21312 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472288.249    141 172.18.0.2 TCP_TUNNEL/200 3687 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
1767472290.458    184 172.18.0.2 TCP_TUNNEL/200 21510 CONNECT www.golem.de:443 - HIER_DIRECT/77.247.84.129 -
lynx golem.de

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

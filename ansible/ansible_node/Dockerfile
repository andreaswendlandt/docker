FROM debian:trixie
ARG SSH_KEY_PUB
USER root
RUN groupadd -g 1000 ansible && \
    useradd -u 1000 -g 1000 -m -s /bin/bash ansible && \
    mkdir /home/ansible/.ssh/ && \
    echo "$SSH_KEY_PUB" > /home/ansible/.ssh/authorized_keys && \
    chown -R ansible:ansible /home/ansible/.ssh/ && \
    chmod 644 /home/ansible/.ssh/authorized_keys && \
    apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y ssh && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

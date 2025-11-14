FROM debian:trixie
ARG SSH_KEY
USER root
RUN groupadd -g 1000 ansible && \
    useradd -u 1000 -g 1000 -m -s /bin/bash ansible && \
    mkdir /home/ansible/.ssh/ && \
    echo "$SSH_KEY" > /home/ansible/.ssh/id_ed25519 && \
    echo "StrictHostKeyChecking no" >> /home/ansible/.ssh/config && \
    chown -R ansible:ansible /home/ansible/.ssh/ && \
    chmod 600 /home/ansible/.ssh/id_ed25519 && \
    apt-get update && \
    apt-get install -y shellcheck && \
    apt-get install -y ansible && \
    apt-get install -y git && \
    apt-get install -y python3 && \
    apt-get install -y vim && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/archive/* /var/lib/apt/lists/*
CMD /bin/bash

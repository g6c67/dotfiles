#!/bin/bash
# Simple docker install script
install() {
    sudo apt update
    sudo apt install ca-certificates gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

postinstall() {
    # Add group docker and add your user
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

    # Configure docker to start on boot with systemd
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
}

remove() {
    # Stop services
    sudo systemctl disable docker.service
    sudo systemctl disable containerd.service

    # Delete software
    sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras

    # Delete files
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
}

case $1 in
    install)
    install
    ;;
    postinstall)
    postinstall
    ;;
    remove)
    remove
    ;;
    *)
    echo "Add a proper argument."
    esac
#!/bin/bash

echo "Installing docker..."
yum install -y yum-utils
sleep 5

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sleep 10

yum install  -y docker-ce docker-ce-cli containerd.io

sleep 5

systemctl start docker
sleep 1
systemctl enable docker


echo "Installing docker-compose..."
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 10

chmod +x /usr/local/bin/docker-compose
sleep 5
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

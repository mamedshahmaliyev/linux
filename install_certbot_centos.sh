#!/bin/bash

echo "Installing snapd..."
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install core
sudo snap refresh core
sleep 5
sudo snap install core
sudo snap refresh core

echo "Installing certbot..."
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
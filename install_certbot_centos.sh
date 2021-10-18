#!/bin/bash

echo "Installing snapd..."
yum install epel-release -y
sleep 1
yum install snapd -y
sleep 1
systemctl enable --now snapd.socket
sleep 1
sudo ln -s /var/lib/snapd/snap /snap
sleep 1

snap install core
sleep 1
snap refresh core
sleep 5
snap install core
sleep 1
snap refresh core

echo "Installing certbot..."
snap install --classic certbot
sleep 1
ln -s /snap/bin/certbot /usr/bin/certbot

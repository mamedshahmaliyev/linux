This repo contains different linux script snippets.

# How to restrict ssh tunneling only in linux

https://unix.stackexchange.com/questions/14312/how-to-restrict-an-ssh-user-to-only-allow-ssh-tunneling

Put the following into your /etc/ssh/sshd_config

```
Match User restricted_user
  # AllowTcpForwarding yes # this allows all ports
  PermitOpen localhost:3306 127.0.0.1:3306 # this allows specific ports only
  X11Forwarding no
  AllowAgentForwarding no
  ForceCommand /bin/false
  ```
  
  Get Largest folders in linux:
  
  `du -h * | sort -h`
  
  
# time zone baku

`mv /etc/localtime /etc/localtime.bak && ln -s /usr/share/zoneinfo/Asia/Baku /etc/localtime`

# install xubuntu and xrdb 22.04
```
sudo apt update
sudo apt install xfce4
sudo apt install xubuntu-desktop
sudo apt install xrdp
sudo systemctl enable --now xrdp
sudo ufw allow from any to any port 3389 proto tcp
```

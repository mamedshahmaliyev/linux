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

# top largest tables mysql
```
SELECT table_schema,
       table_name,
       CONCAT(ROUND(table_rows / 1000000, 2), 'M')                                    'rows',
       CONCAT(ROUND(data_length / ( 1024 * 1024 * 1024 ), 2), 'G')                    'DATA',
       CONCAT(ROUND(index_length / ( 1024 * 1024 * 1024 ), 2), 'G')                   'idx',
       CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 * 1024 ), 2), 'G') total_size,
       ROUND(index_length / data_length, 2)                                           idxfrac
FROM   information_schema.TABLES
ORDER  BY data_length + index_length DESC
LIMIT  10;
```

# self signed wildcard certificate
```
subject="
O=Org
commonName=*
"

openssl genrsa -out "self_signed_wildcard.key" 2048
openssl req -new -subj "$(echo -n "$subject" | tr "\n" "/")" -key "self_signed_wildcard.key" -out "self_signed_wildcard.csr"
openssl x509 -req -days 9990 -in "self_signed_wildcard.csr" -signkey "self_signed_wildcard.key" -out "self_signed_wildcard.crt"
rm "self_signed_wildcard.csr"
```

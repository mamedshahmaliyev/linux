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

docker run -it -v ./ssl:/ssl --rm alpine/openssl req -new -newkey rsa:4096 -days 10000 -nodes -x509 -subj "/C=US/ST=US/O=Home/OU=IT/CN=*" -keyout /ssl/self.key -out /ssl/self.crt

```
subject="
C=US
ST=US
O=Home
organizationalUnitName=Home
commonName=*
"

openssl genrsa -out "self_signed_wildcard.key" 2048
openssl req -new -subj "$(echo -n "$subject" | tr "\n" "/")" -key "self_signed_wildcard.key" -out "self_signed_wildcard.csr"
openssl x509 -req -days 9990 -in "self_signed_wildcard.csr" -signkey "self_signed_wildcard.key" -out "self_signed_wildcard.crt"
rm -rf "self_signed_wildcard.csr"

```



# pyenv multiple python
```
brew install pyenv
brew install openssl readline sqlite3 xz zlib
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force
brew install openssl
pyenv install --list | grep 3.8
pyenv install 3.10.12
pyenv local 3.10.12
eval "$(pyenv init -)"
python --version
```

# ffmpeg

## Bulk Video quality lowering in folder (increase 33 to get lower quality and size)
```
for f in *.mp4; do ffmpeg -i "${f}"  -vcodec libx264 -crf 33 "../low_quality/${f%%.*}.mp4"; done
```

## mac format usb/sd card with block size 4096
```
diskutil list
diskutil unmountDisk /dev/disk5
sudo newfs_msdos -F 32 -c 8 -v NEW_NAME /dev/disk5
```

## find largest files:
```
sudo find / -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10
```


## move boot partition:
```
https://unix.stackexchange.com/questions/385696/can-i-move-boot-linux-partition-to-another-drive-or-partition-and-just-boot-from
in mac install xquartz
If you are moving the files to new partition then don't forget to use cp -p while copying to preserve permissions. adjust then your /etc/fstab to the new UUID's of partitions that you will use. You can get the partition uuid by running blkid /dev/sdXn where X is name of the drive and n number of partition.

You can also use blkid to attach labels to your partitions and then mount via labels which is much easier read man blkid to learn more.

After you change the partitions and adjust /etc/fstab you should run the update-grub - available on Debian/Ubuntu script or grub-mkconfig -o /boot/grub/grub.cfg to generate a new config file and then reinstall grub into the first hdd that you bot from. grub-install --recheck /dev/sda

https://forums.centos.org/viewtopic.php?t=75043
grub2-mkconfig -o /boot/grub2/grub.cfg

Of course do not forget that when copiying mount a new / or /boot partition on /mnt and after copying all of the files mount them as / and /boot chroot and only then run update of the grub if you want things to be done correctly.
```










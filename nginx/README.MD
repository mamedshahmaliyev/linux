## SERVER SETUP

1. Fix time issues
2. Install nginx (yum install nginx -y), adjust home page
3. Install Certbot (https://certbot.eff.org/lets-encrypt/centosrhel8-nginx)

## SCRIPTS

1. scripts/copy_conf.sh, nginx -t, service nginx restart
2. scripts/letsencrypt-cert.sh domain_name, to generate letsencrypt cert
3. scripts/self-signed-cert.sh domain_name, to generate self signed cert

## SELINUX
https://www.nginx.com/blog/using-nginx-plus-with-selinux/

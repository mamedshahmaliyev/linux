#!/bin/bash

if [ -z "$1" ]
then
      echo "use this script as follows: letsencrypt-cert.sh domain_name"
      exit 0
fi

domain="$1"

certbot certonly --agree-tos --email admin@$domain --webroot -w /var/lib/letsencrypt/ -d $domain

rm -Rf /certs/$domain && cp -LR /etc/letsencrypt/live/$domain /certs/
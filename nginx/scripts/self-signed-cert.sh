#!/bin/bash

if [ -z "$1" ]
then
      echo "use this script as follows: self-signed-cert.sh domain_name"
      exit 0
fi

domain="$1"

mkdir -p /certs
mkdir -p /self-signed-certs/$domain

openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509  -subj "/C=AZ/ST=Baku/L=Baku/O=UIS/CN=$domain"  -keyout /self-signed-certs/$domain/privkey.pem  -out /self-signed-certs/$domain/fullchain.pem
rm -Rf /self-signed-certs/$domain/chain.pem && cp /self-signed-certs/$domain/fullchain.pem /self-signed-certs/$domain/chain.pem

rm -Rf /certs/$domain && cp -LR /self-signed-certs/$domain /certs/
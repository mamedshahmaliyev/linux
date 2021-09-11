#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR
cd ..

#rm -Rf /etc/nginx/conf.d/*
\cp -r conf.d/* /etc/nginx/conf.d/
\cp -r snippets /etc/nginx
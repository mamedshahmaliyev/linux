#!/bin/bash

if [ -z "$1" ]
then
    echo "use this script as follows: git_pull.sh /path/to/. Otherwise, current directory will be used as default"
else
    cd "$1"
fi

git fetch
git pull --no-edit --force
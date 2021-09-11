#!/bin/bash

containers=$(sudo docker ps -a | awk '{if(NR>1) print $NF}')
for container in $containers
do
    echo $container
    echo "" > $(docker inspect --format='{{.LogPath}}' $container)
done
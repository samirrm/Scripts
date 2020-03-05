#!/bin/bash


PATH_PROJETO="/opt/docker/projeto"
COMPOSE_FILE="docker-compose.yaml"

cd $PATH_PROJETO

for va in $(ls -1 ); do

    cd $va
    pwd
    docker-compose $1 $2

    cd ..

done
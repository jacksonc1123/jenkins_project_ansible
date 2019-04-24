#!/bin/bash

DOCKER_CONTAINER_NAME="ansible-test"

cd docker && docker build -t ubuntu_jenkins .

docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 myubuntu

cd ../ansible && ansible-playbook -i env/local_docker main.yml -vvv

docker stop $DOCKER_CONTAINER_NAME

docker rm $DOCKER_CONTAINER_NAME

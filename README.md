# docker_notes
all about docker

## Docker run
docker run -it -d ubuntu

## List all containers
docker ps -a

## Connect to the conatiner
docker exec -it {container ID} bash

# To install nginx
apt update  
apt upgrade  
apt install nginx  
apt install curl  
service reload nginx  
service restart nginx  
curl localhost
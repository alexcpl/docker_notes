# nginx reverse proxy

http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/

## Create a docker network first


======================== docker-compose.yml ==========================================
version: '3'

services:
  #Reverse Proxy with nginx
  nginx-proxy:
    image: jwilder/nginx-proxy
    container_name: nginx-proxy
    ports:
      - "80:80"
    volumes:
      - ./client_max_body_size.conf:/etc/nginx/conf.d/client_max_body_size.conf 
      - /var/run/docker.sock:/tmp/docker.sock:ro

networks:
  default:
    external:
      name: nginx-proxy
======================================================================================

=========================== other containers use =====================================
    expose:
      - 80
================== AND SET ====================
    environment:
      VIRTUAL_HOST: your-domain.com
================== FINALLY SET ================
networks:
  default:
    external:
      name: nginx-proxy
      

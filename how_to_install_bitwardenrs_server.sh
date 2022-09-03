--- This image is deprecated ---
version: '2'

services:
  bitwarden:
    image: bitwardenrs/server
    restart: always
    ports:
      - 5555:80
    volumes:
      - ./data:/data # if run on portainer, change the(.) current directory to absolute path
    environment:
      WEBSOCKET_ENABLED: 'true' # Required to use websockets
      SIGNUPS_ALLOWED: 'true'   # set to false to disable signups
--- end of file ---
      
# vaultwarden
docker run -d \
--name vaultwarden \
-v /vw-data/:/data/ \
-p 5555:80 \
vaultwarden/server:latest


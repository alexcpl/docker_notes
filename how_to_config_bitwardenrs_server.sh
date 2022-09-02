version: '2'

services:
  bitwarden:
    image: bitwardenrs/server
    restart: always
    ports:
      - 5555:80
    volumes:
      - /volume1/docker/bitwarden:/data
    environment:
      WEBSOCKET_ENABLED: 'true' # Required to use websockets
      SIGNUPS_ALLOWED: 'true'   # set to false to disable signups

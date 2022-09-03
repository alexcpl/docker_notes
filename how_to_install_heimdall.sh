---
version: "2.1"
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall
    container_name: heimdall
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Hong_Kong
    volumes:
      - ./heimdall/config:/config # because where you run the script, just in case change (.) to your absolute path
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped

version: "2"
services:
  firefox:
    image: linuxserver/firefox:78.13.0
    container_name: firefox
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Hong_Kong
    volumes:
      - ./config:/config # because where you run the script, just in case change (.) to your absolute path
    ports:
      - 3000:3000
    shm_size: "1gb"
    restart: unless-stopped

# docker compose webtop - https://docs.linuxserver.io/images/docker-webtop
---
version: "2.1"
services:
  webtop:
    image: lscr.io/linuxserver/webtop:ubuntu-mate
    container_name: webtop
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Hong_Kong
      - SUBFOLDER=/ #optional
      - KEYBOARD=en-us-qwerty #optional
    volumes:
      - /home/alexcpl/dockers/webtop/config:/config
      - /var/run/docker.sock:/var/run/docker.sock #optional
    ports:
      - 3000:3000
    shm_size: "1gb" #optional
    restart: unless-stopped

# Display Chinese in webtop browser
$ sudo apt update
$ sudo apt install wget
$ wget https://github.com/sonatype/maven-guide-zh/raw/master/content-zh/src/main/resources/fonts/simsun.ttc
$ wget https://github.com/alexcpl/Linux_Chinese_Font_types/blob/master/simsun.ttc
$ sudo mkdir /usr/share/fonts/win
$ sudo mv simsun.ttc /usr/share/fonts/win
$ fc-cache -vf
$ fc-list :lang=zh

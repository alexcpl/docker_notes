version: "2"

services:
  filebrowser:
    image: hurlenko/filebrowser
    container_name: filebrowser
    # user: "${UID}:${GID}"
    # default login admin:admin
    user: "1026:101"
    ports:
      - 8081:8080
    volumes:
      - /homes/USERNAME/docker:/data/docker
      - /homes/USERNAME:/data/home
      - /volume1/old_storage:/data/old_storage
      - filebrowser:/config
    # environment:
    #   - FB_BASEURL=/filebrowser
    restart: always
volumes:
  filebrowser:

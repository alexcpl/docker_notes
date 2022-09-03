--- example ---
version: "2.1"
services:
  code-server:
    image: lscr.io/linuxserver/code-server:latest
    container_name: code-server
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Hong_Kong
      - PASSWORD=password #optional
      - HASHED_PASSWORD= #optional
      - SUDO_PASSWORD=password #optional
      - SUDO_PASSWORD_HASH= #optional
      - PROXY_DOMAIN=code-server.my.domain #optional
      - DEFAULT_WORKSPACE=/config/workspace #optional
    volumes:
      - ./config:/config # because where you run the script, just in case change (.) to your absolute path
    ports:
      - 8443:8443
    restart: unless-stopped

---
version: "2.1"
services:
  code-server:
    image: lscr.io/linuxserver/code-server:latest
    container_name: code-server
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Hong_Kong
      - DEFAULT_WORKSPACE=/config/workspace #optional
    volumes:
      - ./config:/config # because where you run the script, just in case change (.) to your absolute path
    ports:
      - 8443:8443
    restart: unless-stopped

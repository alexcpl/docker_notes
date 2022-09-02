version: '3.4'

services:
  bds:
    image: itzg/minecraft-bedrock-server
    environment:
      EULA: "TRUE"
      GAMEMODE: creative
      DIFFICULTY: easy
    ports:
      - 19132:19132/udp
    volumes:
      - ./data:/data # if run on portainer, change the (.) current directory to abs path
    stdin_open: true
    tty: true
    
    # after stack run navigate to data directory and find server.properties to edit your world generate properties

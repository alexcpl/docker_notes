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
      - ./data:/data # if run on portainer, change the (.) current directory to absolute path
    stdin_open: true
    tty: true
    
# after stack run navigate to data directory and find server.properties to edit your world generate properties
# on portainer navigate to container page, find your minecraft server container and click on the Attach link to access your server conaole
# in there you can add user to op role
# more setting please visit 
# https://nodecraft.com/support/games/minecraft-bedrock/how-to-setup-op-admin-in-your-minecraft-bedrock-edition-server#h-lesscodegreaterpermissionsjsonlesscodegreater-file-efb7208017
# permissions.json file for user id role table

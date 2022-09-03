# vaultwarden
docker run -d \
--name vaultwarden \
-v /vw-data/:/data/ \
-p 5555:80 \
vaultwarden/server:latest

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /volume1/@docker/volumes:/var/lib/docker/volumes \ # find your docker installation where it locate the volumes folder
  -v /:/host \
  -v portainer_agent_data:/data \
  --restart always \
  -p 9001:9001/tcp \
  -e EDGE=1 \
  -e EDGE_ID={your portainer server ID code} \
  -e EDGE_KEY={your portainer server KEY} \
  -e EDGE_INSECURE_POLL=1 \
  --name portainer_edge_agent \
  portainer/agent:latest
  
  # on normal linux server, docker volumes should be on /var/lib/docker/volumes
  # on Synology NAS, docker volumes locate on /volume1/@docker/volumes

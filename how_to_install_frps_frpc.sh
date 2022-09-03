# FRPS
docker run \
--restart=always \
--network host -d \
-v ./frps.ini:/etc/frp/frps.ini \ # because where you run the script, just in case change (.) to your absolute path
--name frps \
snowdreamtech/frps

# firewall rules
sudo iptables -A INPUT -p tcp --dport 7000 -j ACCEPT

# frps frps.ini file
# frps.ini
[common]
bind_port = 7000
vhost_http_port = 8080

#FRPC
docker run \
--restart=always \
--network host -d \
-v ./frpc.ini:/etc/frp/frpc.ini \ # because where you run the script, just in case change (.) to your absolute path
--name frpc \
snowdreamtech/frpc

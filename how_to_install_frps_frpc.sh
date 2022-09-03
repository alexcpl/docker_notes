# FRPS

docker run \
--restart=always \
--network host -d \
-v [/path/to/your/config/file]/frps.ini:/etc/frp/frps.ini \
--name frps \
snowdreamtech/frps

# firewall rules
sudo iptables -A INPUT -p tcp --dport 7000 -j ACCEPT

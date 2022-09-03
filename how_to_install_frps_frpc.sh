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

# frpc.ini
[common]
server_addr = [YOUR SERVER IP ADDRESS]
server_port = 7000

[DSM-https]
type = tcp
local_ip = 192.168.1.200
local_port = 5001
remote_port = 5001
custom_domains = custom.example.com

[web-https]
type = tcp
local_ip = 192.168.1.200
local_port = 443
remote_port = 443
custom_domains = frp-https.example.com

[web-http]
type = tcp
local_ip = 192.168.1.200
local_port = 80
remote_port = 80
custom_domains = frp.example.com

[site2-https]
type = tcp
local_ip = 192.168.1.200
local_port = 443
remote_port = 4431
custom_domains = frp.example.com

[ssh]
type = tcp
local_ip = 192.168.1.200
local_port = 22
remote_port = 6339
custom_domains = ssh.example.com

[range:services]
type = tcp
local_ip = 192.168.1.201
local_port = 21115-21119
remote_port = 21115-21119
custom_domains = services.example.com

[services21116]
type = udp
local_ip = 192.168.1.201
local_port = 21116
remote_port = 21116
custom_domains = services.example.com

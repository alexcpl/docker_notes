# FRPS
docker run \
--restart=always \
--network host -d \
-v ./frps.ini:/etc/frp/frps.ini \ # becareful where you run the script, just in case change (.) to your absolute path
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
-v ./frpc.ini:/etc/frp/frpc.ini \ # becareful where you run the script, just in case change (.) to your absolute path
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
remote_port = 1443
custom_domains = frp.example.com

[ssh]
type = tcp
local_ip = 192.168.1.200
local_port = 22
remote_port = 22
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

# find new config setting on 2022-09-05 ----------------------------------------------------------------------------------------------------
# Server side frps.ini
[common]
# 监听端口
bind_port = 7000
# 面板端口
dashboard_port = 7500
# 登录面板账号设置
dashboard_user = admin
dashboard_pwd = spoto1234
# 设置http及https协议下代理端口（非重要）
vhost_http_port = 7080
vhost_https_port = 7081


# 身份验证
token = 12345678

#服务器镜像：snowdreamtech/frps
#重启：always
#网络模式：host
#文件映射：/etc/frp/frps.ini:/etc/frp/frps.ini

docker run --restart=always --network host -d -v /etc/frp/frps.ini:/etc/frp/frps.ini --name frps snowdreamtech/frps

# Client side
# 服务器镜像：snowdreamtech/frpc
# 重启：always
# 网络模式：host
# 文件映射：/路径/frp/:/etc/frp/

# frpc.ini
[common]
# server_addr为FRPS服务器IP地址
server_addr = x.x.x.x
# server_port为服务端监听端口，bind_port
server_port = 7000
# 身份验证
token = 12345678

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 2288

# [ssh] 为服务名称，下方此处设置为，访问frp服务段的2288端口时，等同于通过中转服务器访问127.0.0.1的22端口。
# type 为连接的类型，此处为tcp
# local_ip 为中转客户端实际访问的IP 
# local_port 为目标端口
# remote_port 为远程端口

[ssh]
type = tcp
local_ip = 192.168.1.229
local_port = 80
remote_port = 18022

[unRAID web]
type = tcp
local_ip = 192.168.1.229
local_port = 80
remote_port = 18088

[Truenas web]
type = tcp
local_ip = 192.168.1.235
local_port = 80
remote_port = 18188

[speedtest]
type = tcp
local_ip = 192.168.1.229
local_port = 6580
remote_port = 18190


[webdav]
type = tcp
local_ip = 192.168.1.235
local_port = 18080
remote_port = 18189

[RDP PC1]
type = tcp
local_ip = 192.168.1.235
local_port = 3389
remote_port = 18389

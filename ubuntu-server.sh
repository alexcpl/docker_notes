# Add user
$ adduser USERNAME
$ usermod -aG sudo USERNAME

# Update the system
$ apt update && apt upgrade -y

# Install docker and docker-compose
$ apt install docker.io
$ apt install docker-compose

# Add user to docker group
$ usermod -aG docker USERNAME

# Install portiner
$ docker volume create portainer_data
$ docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# Install webmin - https://webmin.com/deb.html
$ wget http://prdownloads.sourceforge.net/webadmin/webmin_2.000_all.deb
$ dpkg --install webmin_2.000_all.deb

# Using the Webmin APT repository
# edit the /etc/apt/sources.list file on your system and add the line :
deb https://download.webmin.com/download/repository sarge contrib

# fetch and install my GPG key for ubuntu 22.04
$ cd /root
$ wget https://download.webmin.com/jcameron-key.asc
$ cat jcameron-key.asc | gpg --dearmor >/usr/share/keyrings/jcameron-key.gpg

# install webmin
$ apt-get install apt-transport-https
$ apt-get update
$ apt-get install webmin

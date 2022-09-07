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
# alt package json - https://raw.githubusercontent.com/SelfhostedPro/selfhosted_templates/master/Template/portainer-v2.json
$ docker volume create portainer_data
$ docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# Install webmin - https://webmin.com/deb.html
$ wget http://prdownloads.sourceforge.net/webadmin/webmin_2.000_all.deb
$ apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python3 unzip
$ dpkg --install webmin_2.000_all.deb

# access control panel --> https://server_ip:10000
# to access chrome block page click on any empty space and type thisisunsafe

# Install watchtower to keep to containers update
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock -e WATCHTOWER_RUN_ONCE=TRUE containrrr/watchtower:latest

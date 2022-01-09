# dockerwordpress
docker Wordpress for development 

# MariaDB + Wordpress

First install docker
https://www.docker.com/

## Then pull MariaDB image - https://store.docker.com/images/mariadb
docker pull mariadb:10.3.2

## Create the mariaDB container
docker run --name mariadb10 -e MYSQL_ROOT_PASSWORD=password -d -v /Users/alexcpl/Code/env/mariadb/data:/var/lib/mysql -p 3306:3306 mariadb:10.3.2

* --name mariadb10 (the name of the container)
* -e MYSQL_ROOT_PASSWORD={your_password} (Set mariaDB server root password)
* -d run the container as daemon
* -v /local/folder:/var/lib/mysql (map local volume /local/folder to server /var/lib/mysql)
* -p 3306:3306 (map local_port to container_port)
* mariadb:10.3.2 (from docker image)

## Then pull Wordpress image - https://store.docker.com/images/wordpress
docker pull wordpress:4.8.2-apache

## Create wordpress container
docker run --name wordpress_c27 -d -v /Users/alexcpl/Code/c27:/var/www/html/wp-content -p 80:80 --link mariadb10:mysql wordpress:4.8.2-apache

* --name wordpress_c27 (the name of the container)
* -d run the container as daemon
* -v /local/folder:/var/www/html/wp-content (map local folder to wordpress wp-content folder)
* -p 80:80 (map local_port to container_port)
* --link my_database:mysql (map my database server to container mysql server)
* wordpress:4.8.2-apache (from docker image)

## edit hosts file
map your domain to localhost or 127.0.0.1 (incase some plugins or theme need to bind to the domain name)

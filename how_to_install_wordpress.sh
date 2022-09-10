# docker compose file
version: "3"
 
services:
   wordpress-db:
     container_name: wordpress-db
     image: mysql:latest
     volumes:
       - ./db:/var/lib/mysql
     restart: always
     #ports:
       #- 3306:3306
     environment:
       MYSQL_ROOT_PASSWORD: VeryStrongAdminP@ssw0rd
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress_user
       MYSQL_PASSWORD: wordpress_P@ssw0rd
     networks:
      - wp-network
 
   wordpress:
     container_name: wordpress
     depends_on:
       - wordpress-db
     image: wordpress:latest
     ports:
       - 8081:80
     restart: always
     volumes:
       - ./uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
       - ./html:/var/www/html
     environment:
       WORDPRESS_DB_HOST: wordpress-db:3306
       WORDPRESS_DB_USER: wordpress_user
       WORDPRESS_DB_PASSWORD: wordpress_P@ssw0rd
       WORDPRESS_DB_NAME: wordpress
     networks:
      - wp-network
     
   wordpress-pma:
    image: phpmyadmin/phpmyadmin
    container_name: wordpress-pma
    depends_on:
        - wordpress-db
    environment:
        - PMA_HOST=wordpress-db
        - PMA_PORT=3306
        - PMA_ARBITRARY=1
    ports:
        - 8082:80
    restart: always
    networks:
      - wp-network
    
networks:
  wp-network:
    driver: bridge
    
    
# uploads.ini change the upload file size to 100Mb
upload_max_filesize = 100M
post_max_size = 100M


# docker-compose wordpress quick start
services:
  db:
    # We use a mariadb image which supports both amd64 & arm64 architecture
    #image: mariadb:10.6.4-focal
    # If you really want to use MySQL, uncomment the following line
    image: mysql:8.0.27
    container_name: cers-db
    command: '--default-authentication-plugin=mysql_native_password'
    volumes:
      - /home/alexcpl/docker/wordpress/db:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=wpiw795r2uyj#nMZTU
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=*CRbdrc7&YQmAN%@sm
    expose:
      - 3306
    networks:
      - wp-network
  wordpress:
    image: wordpress:latest
    container_name: cers-wordpress
    depends_on:
        - db
    ports:
      - 8081:80
    volumes:
       - /home/alexcpl/docker/wordpress/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
       - /home/alexcpl/docker/wordpress/html:/var/www/html
    restart: always
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=*CRbdrc7&YQmAN%@sm
      - WORDPRESS_DB_NAME=wordpress
    networks:
      - wp-network
  wordpress-pma:
    image: phpmyadmin/phpmyadmin
    container_name: cers-pma
    depends_on:
        - db
    environment:
        - PMA_HOST=db
        - PMA_PORT=3306
        - PMA_ARBITRARY=1
    ports:
        - 8082:80
    restart: always
    networks:
      - wp-network
volumes:
  db_data:
networks:
  wp-network:
    driver: bridge

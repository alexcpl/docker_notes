# uploads.ini change the upload file size to 100Mb
upload_max_filesize = 100M
post_max_size = 100M


# docker-compose wordpress quick start
services:
  db:
    # We use a mariadb image which supports both amd64 & arm64 architecture
    #image: mariadb:10.6.4-focal
    # If you really want to use MySQL, uncomment the following line
    # image: mysql:latest
    image: mysql:8.0.27
    container_name: [CONTAINER_NAME-db]
    command: '--default-authentication-plugin=mysql_native_password'
    volumes:
      - [PROJECT_PATH]/db:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=[ROOT_PASSWORD]
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=[DATABASE_PASSWORD]
    expose:
      - 3306
    networks:
      - [PROJECT]-network

  wordpress:
    image: wordpress:latest
    container_name: [CONTAINER_NAME-wordpress]
    depends_on:
        - db
    ports:
      - 8081:80
    volumes:
       - [PROJECT_PATH]/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
       - [PROJECT_PATH]/html:/var/www/html
    restart: always
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=[DATABASE_PASSWORD]
      - WORDPRESS_DB_NAME=wordpress
    networks:
      - [PROJECT]-network

  wordpress-pma:
    image: phpmyadmin/phpmyadmin
    container_name: [CONTAINER-pma]
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
      - [PROJECT]-network

networks:
  [PROJECT]-network:
    driver: bridge

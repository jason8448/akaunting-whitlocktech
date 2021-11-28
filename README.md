# Akuanting
## Dockerized Veriosn of akuanting

[![Build Status](https://gitlab.com/whitlocktech/akaunting/badges/main/pipeline.svg)](https://gitlab.com/whitlocktech/akaunting/-/commits/main)

This is my version of a dockerized akaunting.

The docker-compose has a mysql image that you can use or remove it from the compose file to use.

MYSQL_ROOT_PASSWORD
MYSQL_DATABASE
MYSQL_USERNAME
MYSQL_PASSWORD

After the service comes up you can acces it at :3186.

If you wish to use a proxy infront of this image exit the trustedpry.php in config. If you uncomment the proxy line it will trust all proxies in front of it.



docker-compose.yml

```
---
version: "3"
services:
  akaunting:
    image: whitlocktech/akaunting:latest
    container_name: akaunting
    environment:
      - AKAUNTING_URL=https://akaunting.example.com
    ports:
      - 3186:80
    volumes:
      - akaunting-data:/var/www/html/    
    restart: unless-stopped
    depends_on: 
     - akaunting_db

  akaunting_db:
    image: mysql:8.0.26
    container_name: akaunting_db
    environment:
     - MYSQL_ROOT_PASSWORD=MySql3-TestPass
     - MYSQL_DATABASE=akaunting
     - MYSQL_USER=akaunting
     - MYSQL_PASSWORD=Akaunting_db-Password
    ports:
     - 3306:3306
    volumes:
     - ./mysql:/var/lib/mysql

volumes:
   akaunting-data:
   

```


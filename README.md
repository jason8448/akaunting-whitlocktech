# Akuanting
## Dockerized Veriosn of akuanting

[![Build Status](https://gitlab.com/whitlocktech/akaunting/badges/main/pipeline.svg)](https://gitlab.com/whitlocktech/akaunting/-/commits/main)

This is my version of a dockerized akaunting.

Right now this works for your private network but i haven't
got it working for external proxied service yet.

This has builtin mysql db. the variables are as follows.

MYSQL_ROOT_PASSWORD
MYSQL_DATABASE
MYSQL_USERNAME
MYSQL_PASSWORD

After the service comes up you can acces it at :3186.

Added an arm32 docker image. To use it cp docker-compose.yml.arm32 to docker-compose.yml then docker-compose up -d, and access it at :3186.

docker-compose.yml

'''
---
version: "3"
services:
  akaunting:
    image: whitlocktech/akaunting:latest
    container_name: akaunting
    environment:
      - AKAUNTING_URL=https://akaunting.whitlocktech.com
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
   

'''


# Akuanting
## Dockerized Veriosn of akuanting

[![Build Status](https://gitlab.com/whitlocktech/akaunting/badges/main/pipeline.svg)](https://gitlab.com/whitlocktech/akaunting/-/commits/main)

This is my version of a dockerized akaunting.

Right now this works for your private network but i haven't
got it working for external proxied service yet.
<<<<<<< HEAD

### Requirements
- External Mysql/ Mariadb server


After the service comes up you can acces it at :3186.

Added an arm32 docker image. To use it cp docker-compose.yml.arm32 to docker-compose.yml then docker-compose up -d, and access it at :3186.

=======
For right now use an external Mysql/Mariadb server to host the data. In the future I plan to
add an internal mariadb server.
After the service comes up you can acces it at <machine ip>:3186.
If you want to build this your self you can edit config/akaunting.conf before you build.
Fixed mirror to github.
Added an arm32 docker image. To use it cp docker-compose.yml.arm32 to docker-compose.yml then docker-compose up -d, and access it at <maching ip>:3186. 

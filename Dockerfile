# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="whitlocktech@gmail.com"
LABEL version="0.1"
LABEL description="Dockerized Akaunting"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt -y update

# Install dependacies

RUN apt install -y nginx mariadb-server mariadb-client php7.4 php7.4-imagick php7.4-common php7.4-mysql php7.4-gd php7.4-bcmath php7.4-json php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl


# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="whitlocktech@gmail.com"
LABEL version="1.3"
LABEL description="Dockerized Akaunting"
LABEL Akaunting_version="2.1.25"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt -y update
RUN apt -y upgrade

# Install dependacies

RUN apt install -y nginx php7.4 php7.4-fpm php7.4-imagick php7.4-common php7.4-mysql php7.4-gd php7.4-bcmath php7.4-json php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl unzip wget supervisor

#Supervisor no daemonize

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.4/fpm/php-fpm.conf

#Comented out sections are from areas that i was trying to pull the conf from the host directory to make it easier to edit.

#Download akaunting
RUN wget -O /tmp/akaunting.zip https://github.com/akaunting/akaunting/releases/download/2.1.25/Akaunting_2.1.25-Stable.zip
RUN unzip /tmp/akaunting.zip -d /var/www/html
RUN chown -R www-data:www-data /var/www/html
Run rm /var/www/html/index.nginx-debian.html
RUN rm /etc/nginx/sites-enabled/default
COPY ./config/akaunting.conf /etc/nginx/sites-available/akaunting.conf
COPY ./config/fpm/akaunting_pool.conf /etc/php/7.4/fpm/pool.d
RUN chown root:root /etc/nginx/sites-available/akaunting.conf
RUN ln -s /etc/nginx/sites-available/akaunting.conf /etc/nginx/sites-enabled/akaunting.conf

#copy Supervisord conf into container

COPY ./docker/supervisord.conf /etc/supervisord.conf

#Expose Ports

EXPOSE 80

#Volume to keep the data

VOLUME ["/var/www/html/"]
VOLUME ["/var/www/html/config/trustedproxy.php"]
# CMD

CMD ["/usr/bin/supervisord"]

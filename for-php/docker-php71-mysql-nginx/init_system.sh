#!/bin/bash

yum update -y --skip-broken
yum install -y vim
yum install -y docker
#然后加上docker加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["bqr1dr1n.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
#然后是docker-composer
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#然后是建docker的php开发环境
mkdir /Dockerfiles
cd /Dockerfiles
mkdir php
mkdir nginx
mkdir mysql
touch php/Dockerfile
sudo tee php/Dockerfile <<-'EOF'
FROM php:7.1-fpm
#更新apt-get源 使用163的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update && \
    #apt-get install -y libstdc++6 libcwidget3 libsigc++ && \
    #apt-get install -y libcwidget3 libsigc++-2.0-0c2a aptitude && \
    #aptitude install libjpeg-dev libmcrypt-dev libssl-dev openssl && \
    apt-get install -y libfreetype6-dev libpng-dev zlib1g zlib1g-dev libjpeg-dev libmcrypt-dev libssl-dev openssl && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  &&  \
    docker-php-ext-install gd mysqli mcrypt pdo
RUN apt-get install -y git zip unzip
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN mkdir /www && cd /www
#RUN /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024 && \
#    /sbin/mkswap /var/swap.1 && \
#    /sbin/swapon /var/swap.1
RUN composer create-project laravel/laravel:5.4 blog && cd blog
RUN composer update

#安装node.js
RUN apt-get install nodejs && apt-get install npm
RUN npm install -g bower
RUN npm install -g less
EOF
touch nginx/Dockerfile
sudo tee nginx/Dockerfile <<-'EOF'
FROM nginx:1.9
EOF
touch mysql/Dockerfile
sudo tee mysql/Dockerfile <<-'EOF'
FROM mysql:5.6
EOF
mkdir /www
useradd www-data
#编辑docker-compose.xml
touch docker-compose.xml
sudo tee docker-compose.yml <<-'EOF'
nginx:
    build: ./nginx
    ports:
      - "80:80"
    links:
      - "php"
    volumes:
      - /www:/www

php:
    build: ./php
    ports:
      - "9000:9000"
    links:
      - "mysql"
    volumes:
      - /www:/www
mysql:
    build: ./mysql
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: 123456
EOF
docker-compose up -d


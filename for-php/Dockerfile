FROM php:5.6-fpm
#更新apt-get源 使用163的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg-dev libmcrypt-dev libssl-dev pkg-config openssl && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  &&  \
    docker-php-ext-install gd mysqli mcrypt
RUN apt-get install -y git zip unzip
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN mkdir /www && cd /www
#RUN /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024 && \
#    /sbin/mkswap /var/swap.1 && \
#    /sbin/swapon /var/swap.1
RUN composer create-project laravel/laravel:5.1 blog && cd blog
RUN composer update

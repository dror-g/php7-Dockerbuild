FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    apache2-mpm-prefork \
    apache2-prefork-dev \
    aufs-tools \
    automake \
    bison \
    btrfs-tools \
    build-essential \
    curl \
    git \
    libbz2-dev \
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    re2c \
    libjpeg-dev \
    libpng12-dev \
    libxpm-dev \
    libpcre3-dev \
    libfreetype6-dev \
    libmysqlclient-dev \
    libt1-dev \
    libgd2-xpm-dev \
    libgmp-dev \
    libsasl2-dev \
    libmhash-dev \
    unixodbc-dev \
    freetds-dev \
    libpspell-dev \
    libsnmp-dev \
    libtidy-dev \
    libxslt1-dev \
    libmcrypt-dev \
    libicu-dev \
    librecode-dev
    

RUN git clone --depth=1 https://github.com/php/php-src.git /usr/local/src/php

WORKDIR /usr/local/src/php
ENV PHP_DIR /usr/local/php

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h 

#RUN ./buildconf && ./configure --prefix=$PHP_DIR --with-config-file-path=$PHP_DIR --with-config-file-scan-dir=$PHP_DIR/conf.d --with-apxs2=/usr/bin/apxs2 --with-libdir=/lib/x86_64-linux-gnu --without-pear --enable-fpm

RUN ./buildconf && ./configure \
--prefix=$PHP_DIR \ 
--with-config-file-path=$PHP_DIR \ 
--with-config-file-scan-dir=$PHP_DIR/conf.d \ 
--enable-mbstring \ 
--enable-zip \ 
--enable-bcmath \ 
--enable-pcntl \ 
--enable-ftp \ 
--enable-exif \ 
--enable-calendar \ 
--enable-sysvmsg \ 
--enable-sysvsem \ 
--enable-sysvshm \ 
--enable-wddx \ 
--with-curl \ 
--with-mcrypt \ 
--with-iconv \ 
--with-gmp=/usr \ 
--with-pspell \ 
--with-gd \ 
--with-jpeg-dir=/usr \ 
--with-png-dir=/usr \ 
--with-zlib-dir=/usr \ 
--with-xpm-dir=/usr \ 
--with-freetype-dir=/usr \ 
--with-t1lib=/usr \ 
--enable-gd-native-ttf \ 
--enable-gd-jis-conv \ 
--with-openssl \ 
--with-mysql=/usr \ 
--with-pdo-mysql=/usr \ 
--with-gettext=/usr \ 
--with-zlib=/usr \ 
--with-bz2=/usr \ 
--with-recode=/usr \ 
--with-mysqli=/usr/bin/mysql_config \ 
--enable-fpm \ 
--enable-intl \ 
--enable-soap \ 
--with-apxs2=/usr/bin/apxs2 \ 
--with-libdir=/lib/x86_64-linux-gnu  

RUN make -j4 && make install

#ENV APACHE_RUN_USER=www-data \
#    APACHE_RUN_GROUP=www-data \
#    APACHE_LOG_DIR=/var/log/apache2 \
#    APACHE_LOCK_DIR=/var/lock/apache2 \
#    APACHE_PID_FILE=/var/run/apache2.pid

#ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

#RUN a2dismod mpm_event && a2enmod mpm_prefork && service apache2 restart
#EXPOSE 80

#CMD /usr/sbin/apache2ctl -D FOREGROUND
#CMD /bin/bash
#CMD tar czPf /mnt/out/php7-apache.tar.gz $PHP_DIR /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so
#CMD cd $PHP_DIR; tar czPf /mnt/out/php7-apache.tar.gz `find . -type f -print` /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so
#CMD tar -czPf /mnt/out/php7-apache.tar.gz -C /usr/local/  php /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so
#CMD tar -czf /mnt/out/php7-apache.tar.gz -C /usr/local/  php /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so
CMD tar -czf /mnt/out/php7-apache.tar.gz -C /usr/local/  php 

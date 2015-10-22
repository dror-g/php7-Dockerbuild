FROM build:centos7-64
    

RUN git clone -b PHP-7.0 --depth=1 https://github.com/php/php-src.git /usr/local/src/php

WORKDIR /usr/local/src/php
ENV PHP_DIR /usr/local/php7

#RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h 

#RUN ./buildconf && ./configure --prefix=$PHP_DIR --with-config-file-path=$PHP_DIR --with-config-file-scan-dir=$PHP_DIR/conf.d --with-apxs2=/usr/bin/apxs2 --with-libdir=/lib/x86_64-linux-gnu --without-pear --enable-fpm

RUN ./buildconf && ./configure \
--prefix=$PHP_DIR \ 
--with-config-file-path=$PHP_DIR/etc \ 
--with-config-file-scan-dir=$PHP_DIR/etc/conf.d \ 
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
--with-mysql \ 
--with-pdo-mysql=/usr \ 
--with-gettext=/usr \ 
--with-zlib=/usr \ 
--with-bz2=/usr \ 
--with-recode=/usr \ 
--with-mysqli=/usr/bin/mysql_config \ 
--enable-fpm \ 
--enable-intl \ 
--enable-soap \ 
--without-pear \
--with-apxs2 

#--with-libdir=/lib/x86_64-linux-gnu  
#--with-mcrypt \ 

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
#CMD tar -czf /mnt/out/php7-x86_64-$(date +%d%m%y).tar.gz -C /usr/local/  php 
#CMD tar czPf /mnt/out/php7-x86_64-$(date +%d%m%y).tar.gz $PHP_DIR /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so

#RUN cp /etc/apache2/mods-available/php7.load /usr/lib/apache2/modules/libphp7.so /usr/local/php7
RUN cp /etc/httpd/modules/libphp7.so /usr/local/php7

#CMD tar czPf /mnt/out/php7-centos7-x86_64-$(date +%d%m%y).tar.gz /usr/local/php7 
CMD tar czPf /mnt/out/php-7.0-$(date +%d%m%y)-RHEL-x86_64.tar.gz /usr/local/php7 

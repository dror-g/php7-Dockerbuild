
#Ubuntu
------

These tar.gz files were compiled for use on Ubuntu 14.04, and may be compatible with other similar distros.

Install the required dependencies:

    apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmysqlclient-dev \
    libt1-dev \
    libgmp-dev \
    libpspell-dev \
    libicu-dev \
    librecode-dev

Then, unpack the archive (note that the following command will unpack to /usr/local/php7) :

    tar xzPf php7-*.tar.gz

At this point PHP cli should be operational and is available at /usr/local/php7/bin/php .


##Apache
------
To use with apache, first intall apache2, then copy the required modules and libs:

    cp /usr/local/php7/libphp7.so /usr/lib/apache2/modules/
    cp /usr/local/php7/php7.load /etc/apache2/mods-available/



Then, edit /etc/apache2/apache2.conf , and add these lines:

    <FilesMatch \.php$>
    SetHandler application/x-httpd-php
    </FilesMatch>


After that run these commands to switch to mpm_prefork and enable the PHP mpm module:
    
    a2dismod mpm_event
    a2enmod mpm_prefork
    a2enmod php7


#Centos 7
------



Install the required dependencies:

    yum install -y \
    recode-devel \
    aspell-devel \
    libmcrypt-devel \
    t1lib-devel \
    libXpm-devel \
    libpng-devel \
    libjpeg-turbo-devel \
    bzip2-devel \
    openssl-libs \
    libicu-devel

Then, unpack the archive (note that the following command will unpack to /usr/local/php7) :

    tar xzPf php7-*.tar.gz


##Apache
-------
To use with apache, first intall httpd, then copy the required module:

     cp /usr/local/php7/libphp7.so /etc/httpd/modules/

Add the following lines to /etc/httpd/conf/httpd.conf:


    LoadModule php7_module        /usr/lib64/httpd/modules/libphp7.so  
    <FilesMatch \.php$>
    SetHandler application/x-httpd-php
    </FilesMatch>





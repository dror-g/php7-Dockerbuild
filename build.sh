#!/bin/bash
cd /root/php7-Dockerbuild/
git pull

#docker build -t build:32 /root/php7-Dockerbuild/32/machine/
docker build -t build:64 /root/php7-Dockerbuild/64/machine/

#docker build -t made:32 --no-cache /root/php7-Dockerbuild/32/
docker build -t made:64 --no-cache /root/php7-Dockerbuild/64/
docker build -t made:centos7-64 --no-cache /root/php7-Dockerbuild/centos-7-64/

#docker run -v /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7:/mnt/out made:32
docker run -v /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7:/mnt/out made:64
docker run -v /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7:/mnt/out made:centos7-64

ln -sf `ls -1t /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/php-7.0-*-DEB*|head -n1|xargs -n1 basename` /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/php-7.0-latest-DEB-x86_64.tar.gz
ln -sf `ls -1t /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/php-7.0-*-RHEL*|head -n1|xargs -n1 basename` /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/php-7.0-latest-RHEL-x86_64.tar.gz

/usr/local/sbin/pack-deb.sh
docker run -v /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/:/mnt/out pack-rpm build.sh

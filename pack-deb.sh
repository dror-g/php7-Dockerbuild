#!/bin/bash

rm -rf /root/pack-deb
mkdir /root/pack-deb
cd /root/pack-deb

tar xzf /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/php-7.0-latest-DEB-x86_64.tar.gz
mkdir DEBIAN
cat /root/php7-Dockerbuild/control.template|sed "s/Version: 1.0-1/Version: $(date +%y%m%d)/g" > DEBIAN/control
cd ..
dpkg-deb --build pack-deb
mv pack-deb.deb /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/repos/ubuntu/php7-nightly_$(date +%y%m%d)_amd64.deb
#dpkg-scanpackages /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/repos/debian /dev/null | gzip -9c > /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/repos/debian/Packages.gz
cd /usr/zlocal/packaging/repos.zend.net/zend-server/early-access/php7/repos/
dpkg-scanpackages -m ubuntu /dev/null | gzip -9c > ubuntu/Packages.gz


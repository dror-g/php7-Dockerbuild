#!/bin/bash
for i in `docker ps -a|cut -d" " -f1`; do docker rm $i ; done
for i in `docker images|grep none|tr -s " "|cut -d" " -f3`; do docker rmi $i; done

#!/bin/bash
docker stop vio4
docker images
docker rmi my_nginx:1.0
docker build . -t my_nginx:1.0
docker run -d --name vio4 -p 80:81 -v "${PWD}"/nginx/nginx.conf:/etc/nginx/nginx.conf --rm  my_nginx:1.0
docker ps
echo
curl 127.0.0.1:80
echo
echo
curl 127.0.0.1:80/status
#!/bin/bash
docker stop vio
docker run -d --name vio -p 81:81 --rm nginx:latest
docker ps

docker cp server.c vio:/etc/nginx/
docker cp ./nginx/nginx.conf vio:/etc/nginx/

docker exec vio apt-get update
docker exec vio apt-get install -y gcc spawn-fcgi libfcgi-dev
docker exec vio gcc /etc/nginx/server.c -lfcgi -o /etc/nginx/server
docker exec vio spawn-fcgi -p 8080 etc/nginx/server
docker exec vio nginx -s reload

echo
curl 127.0.0.1:81
echo
echo
curl 127.0.0.1:81/status

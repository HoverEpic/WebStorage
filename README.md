# WebStorage
Docker Hub : https://hub.docker.com/r/epicblox/webstorage/
Based on https://github.com/edyan/docker-apache

Simple Apache based storage system with cgi upload.

## Features :
 - quick light storage server
 - simple upload files
 - secure with htaccess / htpasswd

## Volumes :
 - /var/www/

## Environement variables :
 - UPLOAD_DIR : path to upload files via CGI (broken)
 - STORAGE_USER : user for .htpasswd
 - STORAGE_PASS : password for .htpasswd
 
If STORAGE_USER or/and STORAGE_PASS not set, no security is setup.

## Usage
```
    docker run --rm \
    --name webstorage \
    --hostname webstorage \
    -e UPLOAD_DIR=/var/www/uploads \
    -e STORAGE_USER=user \
    -e STORAGE_PASS=pass \
    -p 80:80 \
    -d epicblox/webstorage
```

## Access :
 - online with http://webstorage:8080
 - shell : see test.sh

## Plans :
 - /!\ fix upload dir
 - download / upload scripts in java
 - (other security)[https://httpd.apache.org/docs/current/howto/auth.html]
 - choose where upload file
 - delete a stored file

## Security :
Secutity not tested, if you find any problem, feel free to create an issue.

## Thanks :
 - https://gist.github.com/ohtomi/74c49a4f6b460d9097f7

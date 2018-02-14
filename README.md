# README #

Sources
-
+ [DockerHub Image](https://hub.docker.com/r/hchstera/alpine-php-cron)

+ [Github Dockerfile](https://github.com/hchstera/docker-alpine-php-cron)

Feature & Intro
-
+ custom crontab
    + /etc/cron.d volume your custom crontab files
+ crontab log folder
    + /var/log/cron
    + you can volume the folder from container to host
+ simple diagram
    + ![](https://raw.githubusercontent.com/hchstera/docker-alpine-php-cron/master/pics/alpine-php-cron.png)

Custom crontab by docker-compose
-
#### docker-compose.yml
```yml
version: '2'

services:
    cron:
        image: hchstera/alpine-php-cron:latest
        volumes:
            - ${CRONTABS_PATH}:/etc/cron.d
            - ${CRONTABS_HOST_LOG_PATH}:/var/log/cron
```

#### .env
```env
CRONTABS_PATH=/path/to/custom/cronfolder
CRONTABS_HOST_LOG_PATH=/path/to/host/logfolder
```

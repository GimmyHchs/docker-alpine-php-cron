FROM php:7.1-alpine

LABEL maintainer="g9308370@hotmail.com"

RUN set -ex \
    # install bash
    && apk add --no-cache --update curl\
    vim \
    libjpeg-turbo-dev \
    libpng-dev \
    openssl-dev \
    libmcrypt-dev \
    bash

RUN docker-php-ext-install \
    # Install the PHP mcrypt extension
    mcrypt \
    # Install the PHP pdo_mysql extension
    pdo_mysql \
    # Install the PHP tokenizer extension
    tokenizer

RUN mkdir -p /var/log/cron \
    && mkdir -m 0644 -p /var/spool/cron/crontabs \
    && touch /var/log/cron/cron.log \
    && mkdir -m 0644 -p /etc/cron.d

RUN chmod 777 /var/log/cron/cron.log

COPY start-cron.sh /usr/sbin
RUN chmod 777 /usr/sbin/start-cron.sh

CMD ["/bin/bash", "/usr/sbin/start-cron.sh"]
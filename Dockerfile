FROM php:7.1-alpine

LABEL maintainer="g9308370@hotmail.com"

RUN set -ex \
    # install bash
    && apk add --no-cache \
    bash

RUN mkdir -p /var/log/cron \
    && mkdir -m 0644 -p /var/spool/cron/crontabs \
    && touch /var/log/cron/cron.log \
    && mkdir -m 0644 -p /etc/cron.d

COPY start-cron.sh /usr/sbin
RUN chmod 777 /usr/sbin/start-cron.sh

CMD ["start-cron.sh"]
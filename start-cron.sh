#!/bin/bash
set -e

rm -rf /var/spool/cron/crontabs && mkdir -m 0644 -p /var/spool/cron/crontabs

[ "$(ls -A /etc/cron.d)" ] && cp -f /etc/cron.d/* /var/spool/cron/crontabs/ || true

chmod -R 0644 /var/spool/cron/crontabs

crond /var/spool/cron/crontabs -f -L /var/log/cron/cron.log "$@"

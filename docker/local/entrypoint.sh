#!/bin/bash

ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo 'Europe/Paris' > /etc/timezone

php /var/www/html/bin/console assets:install public && chown root: -R /var/www/html &
php /var/www/html/bin/console d:m:m --no-interaction --allow-no-migration --env=${ENVIRONMENT} && chown root: -R /var/www/html/var > /var/log/dsu.log

# update certificates
chmod 644 /usr/local/share/ca-certificates/ca.crt && update-ca-certificates

#On start Apache
source /etc/apache2/envvars
exec apache2 -D FOREGROUND

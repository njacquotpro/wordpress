FROM php:8.1-apache-buster

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY docker/local/domain.crt /usr/local/share/ca-certificates/ca.crt
COPY docker/local/domain.conf /etc/apache2/sites-available/000-default.conf
COPY docker/local/config.ini /usr/local/etc/php/conf.d/custom.ini
COPY docker/local/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

#CLEANING
RUN apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
#RUN usermod -u 1000 root

CMD ["/usr/bin/entrypoint.sh"]

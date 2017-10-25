#!/bin/bash

docker run --detach \
    --publish 9001:9000 \
    --name php-fpm \
    --restart always \
    --volume /opt/php-7.1.10/etc:/usr/local/etc \
    php-fpm:7.1.10


#!/bin/bash

docker run --detach \
    --name php-fpm \
    --restart always \
    --volume /opt/php-7.1.10/etc:/usr/local/etc \
    --volume /home/chenyarong/sites/vod-ci:/var/www/html:ro \
    php-fpm:7.1.10

# --publish 9001:9000


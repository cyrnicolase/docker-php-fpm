#!/bin/bash

docker run --detach \
    --name php-fpm \
    --restart always \
    --volume /opt/php-7.1.10/etc:/usr/local/etc \
    --volume /home/chenyarong/sites/vod-ci:/var/www/html:ro \
    php-fpm:7.1.10

# --publish 9001:9000
# 这里需要注意的是，因为fpm与nginx是在不同的容器中，那么php需要解析的php 代码也是需要挂载进来的
# 这就看出来了Dockerfile 中的 WORKDIR 的作用


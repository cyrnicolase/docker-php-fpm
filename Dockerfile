#
# php extensions
# 
# version 1
# author chenyarong
# 

FROM php:7.1.10-fpm


# 安装扩展
RUN apt-get update && apt-get -y install libpq-dev libxml2-dev \
    && docker-php-ext-install -j$(nproc) pdo_pgsql bcmath exif soap sockets wddx zip

# 安装 openssl
# RUN docker-php-source extract \
#     && cd /usr/src/php/ext/openssl/ \
#     && cp config0.m4 config.m4 \
#     && docker-php-ext-install -j$(nproc) openssl
    

# 安装 redis
ADD ["http://pecl.php.net/get/redis-3.1.4.tgz", "/tmp"]
RUN cd /tmp \
    && mkdir -p /tmp/redis \
    && tar -zxf redis-3.1.4.tgz -C /tmp/redis \
    && cd /tmp/redis/redis-3.1.4 \
    && phpize \
    && ./configure --enable-redis \
    && make -j$(nproc) \
    && make install \
    && cd /tmp \
    && rm -rf redis* \
    && docker-php-ext-enable redis

# 安装 swoole
ADD ["http://pecl.php.net/get/swoole-1.9.21.tgz", "/tmp"]
RUN cd /tmp \
    && mkdir -p /tmp/swoole \
    && tar -zxf swoole-1.9.21.tgz -C /tmp/swoole \
    && cd /tmp/swoole/swoole-1.9.21/ \
    && phpize \
    && ./configure --with-swoole \
    && make -j$(nproc) \
    && make install \
    && cd /tmp \
    && rm -rf swoole* \
    && docker-php-ext-enable swoole

# 挂载
VOLUME ["/usr/local/etc"]




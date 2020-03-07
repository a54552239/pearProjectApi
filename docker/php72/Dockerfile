FROM php:7.2-cli

# change package source for aliyun
run cp /etc/apt/sources.list /etc/apt/sources.list.bak \
  && echo "deb http://mirrors.aliyun.com/debian buster main" > /etc/apt/sources.list \
  && echo "deb http://mirrors.aliyun.com/debian buster-updates main" >> /etc/apt/sources.list \
  && apt clean;

# update package
RUN apt-get update;

# install php ext
RUN apt-get install -y libzip-dev libzip4 \
  && pecl install redis-5.2.0 \
  && pecl install igbinary-3.1.2 \
  && pecl install zip-1.17.2 \
  && docker-php-ext-enable redis igbinary zip

# install php ext PDO
RUN docker-php-ext-install pdo pdo_mysql

# install php gd ext
RUN apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
  && docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-freetype-dir \
  && docker-php-ext-install -j$(nproc) gd

# install wget
RUN apt-get install wget -y

# install composer
RUN cd /tmp \
  && wget https://mirrors.aliyun.com/composer/composer.phar \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer \
  && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
  && composer self-update \
  && composer clear

WORKDIR /app

CMD ["php", "-S", "0.0.0.0:8081"]
FROM php:7.4-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install --no-install-recommends -y \
        g++ \
        wget \
        libicu-dev \
        libonig-dev \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        vim

RUN curl -s https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --filename=composer

RUN docker-php-ext-install mysqli 

RUN pecl config-set php_ini /etc/php.ini

# Clean repository
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /var/www/
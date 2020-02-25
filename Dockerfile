####################################
# PHPDocker.io PHP 7.3 / Apache #
####################################

FROM phpdockerio/php73-cli

# Install FPM
RUN apt-get update && apt-get -y --no-install-recommends install libapache2-mod-php7.3 \
    php7.3-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-json \
    php7.3-mbstring \
    mcrypt \
    php7.3-mysql \
    php7.3-opcache \
    php7.3-readline \
    php7.3-xml \
    php7.3-zip \
    wget \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN wget https://getcomposer.org/installer --no-check-certificate
RUN php installer
RUN ln -s /composer.phar /usr/bin/composer

# start apache
EXPOSE 80
CMD apache2ctl -D FOREGROUND

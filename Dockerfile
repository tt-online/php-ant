FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /run/php

RUN apt-get install -y language-pack-en-base software-properties-common
RUN LC_ALL=en_GB.UTF-8 add-apt-repository ppa:webupd8team/java -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get update && apt-get install -y oracle-java8-installer ant

RUN LC_ALL=en_GB.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update && apt-get install -y \
    git \
    curl \
    php-cli \
    php7.0 \
    php-json \
    php-xml \
    php7.0-common \
    php-intl \
    php-mcrypt \
    php-apcu \
    php-soap \
    php-redis \
    php-curl \
    php-xdebug

ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
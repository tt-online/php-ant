FROM ttonline/php7:latest

ENV XDEBUG_ENABLED=0

RUN apt-get install -y language-pack-en-base software-properties-common \
 && LC_ALL=en_GB.UTF-8 add-apt-repository ppa:webupd8team/java -y \
 && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
 && apt-get update && apt-get install -y oracle-java8-installer ant \
 && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && rm /etc/php/7.0/cli/conf.d/20-xdebug.ini \
 && mkdir -p /root/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

WORKDIR /var/www

ENTRYPOINT ["/entrypoint.sh"]
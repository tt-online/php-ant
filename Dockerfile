FROM ttonline/php:7.0

ENV XDEBUG_ENABLED=0

RUN apt-get update && apt-get install -y wget \
 && wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz \
 && mkdir /opt/jdk \
 && tar -zxf jdk-8u74-linux-x64.tar.gz -C /opt/jdk \
 && rm jdk-8u74-linux-x64.tar.gz \
 && update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_74/bin/java 100 \
 && update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_74/bin/javac 100 \
 && apt-get install -y ant \
 && apt-get remove -y wget \
 && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && rm /etc/php/7.0/cli/conf.d/20-xdebug.ini \
 && mkdir -p /root/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

WORKDIR /var/www

ENTRYPOINT ["/entrypoint.sh"]
#!/bin/bash

if [ "${XDEBUG_ENABLED}" = "1" ]; then
    echo "zend_extension=xdebug.so" > /etc/php/7.0/cli/conf.d/20-xdebug.ini
fi

if [ -f "/var/config-test/script.sh" ]; then
    chmod 755 /var/config-test/script.sh
    /var/config-test/script.sh
fi

/bin/bash -l -c "$*"
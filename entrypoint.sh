#!/bin/bash

if [ -f "/var/config-test/script.sh" ]; then
    chmod 755 /var/config-test/script.sh
    /var/config-test/script.sh
fi

/bin/bash -l -c "$*"
#!/bin/bash
set -e

if [ $PS_DEV_MODE -ne 0 ]; then
    echo "Post script: Activating debug mode..."
    sed -i "s/define('_PS_MODE_DEV_', false);/define('_PS_MODE_DEV_', true);/" /var/www/html/config/defines.inc.php
    # PS docker image has problem parsing this file, remove it to be able to toggle debug mode in Admin UI
    rm -f /var/www/html/config/defines_custom.inc.php
fi

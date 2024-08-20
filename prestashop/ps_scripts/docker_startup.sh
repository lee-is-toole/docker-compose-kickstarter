#!/bin/bash
set -e
cd "$(dirname "$0")"
export DEBIAN_FRONTEND=noninteractive
export PS_DIR="${PS_DIR:-/var/www/html}"
export MODULE_DIR="${MODULE_DIR:-/var/www/html/modules}"

# PRE-INSTALL scripts
./configure_ngrok.sh

# POST-INSTALL scripts
mkdir -p /tmp/init-scripts/
cp ./init-scripts/activate_debug_mode.sh /tmp/init-scripts/1-activate_debug_mode.sh
cp ./init-scripts/install_modules.sh /tmp/init-scripts/2-install_modules.sh
chmod +x /tmp/init-scripts/*.sh

# Assert the ownership
chown -R www-data:www-data ${PS_DIR}

# Run the former startup script
cd /var/www/html
/tmp/docker_run.sh

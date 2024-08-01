#!/bin/bash

mkdir -p /run/php
mkdir -p /var/www/html/adminer

if [ ! -f /var/www/html/adminer/index.php ]; then
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php && mv adminer-4.8.1-en.php /var/www/html/adminer/index.php
fi

$@

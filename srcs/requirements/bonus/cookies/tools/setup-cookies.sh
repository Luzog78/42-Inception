#!/bin/bash

if [ ! -f /var/www/html/cookies ]; then
	cp -R /root/cookies /var/www/html/cookies
fi

cd /var/www/html/cookies

$@
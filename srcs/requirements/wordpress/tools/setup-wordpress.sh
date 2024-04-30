#!/bin/bash
sleep 10

cd /var/www/html/
if [ ! -f wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/html'
	wp core install		--allow-root \
						--url=$WP_URL \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN_NAME \
						--admin_email=$WP_ADMIN_EMAIL \
						--admin_password=$WP_ADMIN_PASSWORD \
						--skip-email --path='/var/www/html'
	wp user create		--allow-root \
						$WP_USER_NAME $WP_USER_EMAIL \
						--user_pass=$WP_USER_PASSWORD \
						--role=editor --path='/var/www/html'
fi

$@

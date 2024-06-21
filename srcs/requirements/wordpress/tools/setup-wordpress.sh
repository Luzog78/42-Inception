#!/bin/bash
while ! mariadb -h mariadb -u$SQL_USER -p$SQL_PASSWORD <<< "SHOW databases;" &>/dev/null; do
	echo "Waiting for mariadb..."
	sleep 1
done

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

	###########
	## BONUS ##
	###########

	wp config set WP_REDIS_HOST redis \
						--allow-root --path='/var/www/html'

	wp config set WP_REDIS_PORT 6379 --raw \
						--allow-root --path='/var/www/html'

	wp config set WP_CACHE_KEY_SALT $LOGIN_42'.'$URL_DOMAIN \
						--allow-root --path='/var/www/html'

	#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root

	wp config set WP_REDIS_CLIENT phpredis \
						--allow-root --path='/var/www/html'

	wp plugin install redis-cache --activate \
						--allow-root --path='/var/www/html'

	wp plugin update --all \
						--allow-root --path='/var/www/html'

	wp redis enable \
						--allow-root --path='/var/www/html'
fi

$@

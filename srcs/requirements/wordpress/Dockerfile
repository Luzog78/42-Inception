# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/30 05:41:55 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 19:13:45 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

RUN		apt-get update

RUN		apt-get install -y wget php php-fpm php-mysql mariadb-client

RUN		mkdir -p /var/www/html
RUN		mkdir -p /run/php

RUN		wget https://wordpress.org/latest.tar.gz -P /var/www/html
RUN		cd /var/www/html && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN		cd /var/www/html && mv wordpress/* . && rm -rf wordpress
RUN		chmod -R 755 /var/www/html

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY	conf/www.conf /etc/php/8.2/fpm/pool.d

COPY	tools/setup-wordpress.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/setup-wordpress.sh
ENTRYPOINT [ "setup-wordpress.sh" ]

EXPOSE	9000

WORKDIR /var/www/html/

CMD		[ "php-fpm8.2", "-F" ]

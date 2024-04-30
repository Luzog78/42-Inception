# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/30 05:41:55 by ysabik            #+#    #+#              #
#    Updated: 2024/04/30 19:34:56 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

RUN		apt-get update

RUN		apt-get install -y nginx

RUN		mkdir -p /etc/nginx/ssl

RUN		apt-get install -y openssl

RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=CM/L=Angouleme/O=42/OU=42/CN=ysabik.42.fr/UID=ysabik"

RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/conf.d

RUN		chmod 755 /var/www/html	
RUN		chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD		[ "nginx", "-g", "daemon off;" ]

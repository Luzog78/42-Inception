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

RUN		apt-get install -y mariadb-server

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY	tools/setup-mysql.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/setup-mysql.sh
ENTRYPOINT [ "setup-mysql.sh" ]

EXPOSE	3306

CMD		[ "mysqld" ]

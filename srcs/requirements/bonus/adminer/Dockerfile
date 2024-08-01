# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 15:16:03 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 19:27:53 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y
RUN apt install -y wget php7.4-fpm php-mysql

COPY conf/php-fpm-pool.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/setup-adminer.sh /usr/sbin/

EXPOSE 9000

ENTRYPOINT ["bash", "/usr/sbin/setup-adminer.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]

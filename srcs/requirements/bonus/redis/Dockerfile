# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 15:21:28 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 19:13:45 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y
RUN apt install -y redis-server php8.2-redis

COPY conf/redis.conf /etc/redis/

EXPOSE 6379

CMD ["redis-server"]

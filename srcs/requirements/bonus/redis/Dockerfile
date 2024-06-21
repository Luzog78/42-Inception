# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/21 15:31:52 by ysabik            #+#    #+#              #
#    Updated: 2024/06/21 16:17:51 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

RUN		apt-get update

RUN		apt-get install -y redis
 
COPY	tools/setup-redis.sh /usr/local/bin/

EXPOSE	6379

CMD		[ "bash", "/usr/local/bin/setup-redis.sh" ]

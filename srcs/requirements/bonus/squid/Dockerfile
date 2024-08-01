# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 15:23:02 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 15:30:28 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y
RUN apt install -y squid apache2-utils

COPY conf/squid.conf /etc/squid/
COPY conf/domain_blacklist.txt /etc/squid/

COPY tools/setup-squid.sh /usr/sbin/

EXPOSE 8888

ENTRYPOINT ["bash", "/usr/sbin/setup-squid.sh"]

CMD ["squid", "-N"]

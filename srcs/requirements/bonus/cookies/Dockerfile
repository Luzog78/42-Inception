# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 16:13:36 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 19:13:45 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y
RUN apt install -y nodejs

RUN mkdir -p /var/www/html

COPY tools/cookies /root/cookies
COPY tools/server.js /root/
COPY tools/setup-cookies.sh /sbin/

EXPOSE 8080

ENTRYPOINT ["bash", "/sbin/setup-cookies.sh"]

CMD ["node", "/root/server.js"]

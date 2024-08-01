# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/01 15:19:37 by ysabik            #+#    #+#              #
#    Updated: 2024/08/01 15:20:34 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y
RUN apt install -y vsftpd

COPY conf/vsftpd.conf /etc/

RUN mkdir -p /var/www/html
RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 000 /var/run/vsftpd/empty

COPY tools/setup-ftp.sh /usr/sbin/

EXPOSE 20 21

ENTRYPOINT ["bash", "/usr/sbin/setup-ftp.sh"]

CMD ["vsftpd"]

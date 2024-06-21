# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysabik <ysabik@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/30 17:36:38 by ysabik            #+#    #+#              #
#    Updated: 2024/06/21 16:20:55 by ysabik           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


COMPOSE_FILE	=	srcs/docker-compose.yml
DOMAIN_NAME	=	ysabik.42.fr


RESET			=	\033[0m
RED				=	\033[31m
GREEN			=	\033[32m
YELLOW			=	\033[33m
MAGENTA			=	\033[35m
DIM				=	\033[2m


# **************************************************************************** #


all: up

up:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@echo "$(RED)$$> $(MAGENTA)docker compose -f $(COMPOSE_FILE) up -d --build$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d --build
	@$(call host)
	@echo "$(DIM)Running on https://$(DOMAIN_NAME)/$(RESET)"
	@echo "$(GREEN)[[ Docker Compose UP ! ]]$(RESET)"

down:
	@echo "$(RED)$$> $(MAGENTA)docker compose -f $(COMPOSE_FILE) down$(RESET)"
	@docker compose -f $(COMPOSE_FILE) down
	@echo "$(GREEN)[[ Docker Compose DOWN ! ]]$(RESET)"

ps:
	@echo "$(RED)$$> $(MAGENTA)docker ps$(RESET)"
	@docker ps

images:
	@echo "$(RED)$$> $(MAGENTA)docker images$(RESET)"
	@docker images

volume:
	@echo "$(RED)$$> $(MAGENTA)docker volume ls$(RESET)"
	@docker volume ls

network:
	@echo "$(RED)$$> $(MAGENTA)docker network ls$(RESET)"
	@docker network ls

ls: ps images volume network

nginx:
	@echo "$(RED)$$> $(MAGENTA)docker exec -it nginx bash$(RESET)"
	@docker exec -it nginx bash

mariadb:
	@echo "$(RED)$$> $(MAGENTA)docker exec -it mariadb bash$(RESET)"
	@docker exec -it mariadb bash

wordpress:
	@echo "$(RED)$$> $(MAGENTA)docker exec -it wordpress bash$(RESET)"
	@docker exec -it wordpress bash

redis:
	@echo "$(RED)$$> $(MAGENTA)docker exec -it redis bash$(RESET)"
	@docker exec -it redis bash

logs:
	@echo "$(RED)$$> $(MAGENTA)docker compose -f $(COMPOSE_FILE) logs -f$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f

re: clean up

clean:
	$(call exec, docker stop $$(docker ps -qa), $$(docker ps -qa))
	$(call exec, docker rm $$(docker ps -qa), $$(docker ps -qa))
	$(call exec, docker rmi -f $$(docker images -qa), $$(docker images -qa))
	$(call exec, docker volume rm $$(docker volume ls -q), $$(docker volume ls -q))
	$(call exec, docker network rm $$(docker network ls | grep inception | awk '{print $$1}'), $$(docker network ls | grep inception | awk '{print $$1}'))
	$(call exec, rm -rf ~/data/mariadb/*, $$(ls -A ~/data/mariadb 2>/dev/null))
	$(call exec, rm -rf ~/data/wordpress/*, $$(ls -A ~/data/wordpress 2>/dev/null))

	@echo "$(GREEN)[[ Docker PURGED ! ]]$(RESET)"


define host
	@if [ -z "$$(cat /etc/hosts | grep '$(DOMAIN_NAME)')" ]; then \
		echo 127.0.0.1 $(DOMAIN_NAME) >> /etc/hosts; \
	fi;
endef


define exec
	@if [ -n "$$(echo $(2) | awk '{$$1=$$1};1')" ]; then \
		echo "$(RED)$$> $(YELLOW)$$(echo -n $(1) | tr '\n' ' ')$(RESET)"; \
		$(1); \
		if [ $$? -eq 0 ]; then \
			echo "$(GREEN)OK$(RESET)"; \
		else \
			echo "$(RED)Error$(RESET)"; \
		fi; \
		echo; \
	fi;
endef


# **************************************************************************** #


.PHONY: all up down ps images volume network ls nginx mariadb wordpress redis logs re clean

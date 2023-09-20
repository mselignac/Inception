NAME = inception

all: clean re

stop:
	docker compose -f srcs/docker-compose.yml down

clean: stop
	docker system prune -f

fclean: clean
	rm -r /home/mseligna/data/wordpress/*
	rm -r /home/mseligna/data/mariadb/*
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker system prune -fa
re:
	mkdir -p /home/mseligna/data/wordpress /home/mseligna/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build

.PHONY: all stop clean fclean re
all: build

build:
	sudo docker compose -f ./srcs/docker-compose.yml up --build

up:
	sudo docker compose -f ./srcs/docker-compose.yml up

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker stop $$(sudo docker ps -qa); \
	sudo docker rm $$(sudo docker ps -qa); \
	sudo docker rmi -f $$(sudo docker images -qa); \
	sudo docker volume rm $$(sudo docker volume ls -q); \
	sudo docker network rm $$(sudo docker network ls -q); \

fclean:
	sudo rm -rf /home/wchan/data/mariadb/*
	sudo rm -rf /home/wchan/data/wordpress/*

re: fclean all

.PHONY: clean fclean re
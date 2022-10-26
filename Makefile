DATA_PATH 		= /home/rburri/data
DC				= cd srcs/ && sudo docker-compose


all		:
			sudo mkdir -p $(DATA_PATH)
			sudo mkdir -p $(DATA_PATH)/wordpress
			sudo mkdir -p $(DATA_PATH)/database
			sudo chmod 777 /etc/hosts
			sudo echo "127.0.0.1 rburri.42.fr" >> /etc/hosts
			sudo echo "127.0.0.1 www.rburri.42.fr" >> /etc/hosts
			$(DC) up -d

up:
			${DC} up -d 

down	:
			$(DC) down

clean	:
			$(DC) down -v --rmi all --remove-orphans

fclean	:	clean
			sudo docker system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			sudo docker network prune --force

re		:	fclean all

.PHONY : all up down pause unpause clean fclean re
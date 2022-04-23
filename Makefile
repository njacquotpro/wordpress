#############################
# ENVIRONMENT
#############################

export PROJECT_NAME=stack-wordpress
export DB_PREFIX=wp_
export COMPOSE_PROJECT_NAME=${PROJECT_NAME}

#############################
# INSTALLATION
#############################


#############################
# DOCKER
#############################

php:
	@echo "Connecting to PHP containers..."
	docker-compose exec php /bin/bash
	@echo "Connecting to PHP containers [OK]"

build:
	@echo "Starting stack-dev containers..."
	@docker-compose build --force
	@docker-compose up --force-recreate -d
	@echo "Starting stack-dev containers [OK]"

up:
	@echo "Starting stack-dev containers..."
	@docker-compose up --force-recreate -d
	@echo "Starting stack-dev containers [OK]"

down:
	@echo "Stoping stack-dev containers..."
	@docker-compose down
	@echo "Stoping stack-dev containers [OK]"

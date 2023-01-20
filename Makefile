DOCKER_COMPOSE		:= ./docker-compose.yml
PROJECT_NAME		:= MY_TASK
SERVICE_NAME		:= my-task

install: 
	docker-compose -f ${DOCKER_COMPOSE} run --rm --name ${PROJECT_NAME}-install --entrypoint "npm install" ${SERVICE_NAME}

up:
	docker-compose -p ${PROJECT_NAME} -f ${DOCKER_COMPOSE} up --abort-on-container-exit --exit-code-from ${SERVICE_NAME}

cmd:
	docker-compose -p ${PROJECT_NAME} -f ${DOCKER_COMPOSE} exec ${SERVICE_NAME} /bin/sh

down:
	docker-compose -p ${PROJECT_NAME} down

clean:
	docker rm $$(docker ps -q -f status=exited)

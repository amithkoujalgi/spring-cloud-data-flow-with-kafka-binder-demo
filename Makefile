start-services:
	docker-compose -f ./deployment/compose/docker-compose.yml down -v; \
    docker-compose -f ./deployment/compose/docker-compose.yml rm -fsv; \
    docker-compose -f ./deployment/compose/docker-compose.yml up --remove-orphans;

stop-services:
	docker-compose -f ./deployment/compose/docker-compose.yml down -v; \
    docker-compose -f ./deployment/compose/docker-compose.yml rm -fsv;

build:
	mvn clean install
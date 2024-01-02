@ECHO OFF

REM Define paths
SET DOCKER_COMPOSE_FILE=./deployment/compose/docker-compose.yml
SET MVN_EXECUTABLE=mvn

REM Check for command line arguments
IF "%1"=="start-services" GOTO start-services
IF "%1"=="stop-services" GOTO stop-services
IF "%1"=="build" GOTO build

REM Default behavior if no valid argument is provided
ECHO "Invalid argument. Usage: build.bat [start-services|stop-services|build]"
GOTO :EOF

:start-services
    docker-compose -f %DOCKER_COMPOSE_FILE% down -v
    docker-compose -f %DOCKER_COMPOSE_FILE% rm -fsv
    docker-compose -f %DOCKER_COMPOSE_FILE% up --remove-orphans
    GOTO :EOF

:stop-services
    docker-compose -f %DOCKER_COMPOSE_FILE% down -v
    docker-compose -f %DOCKER_COMPOSE_FILE% rm -fsv
    GOTO :EOF

:build
    %MVN_EXECUTABLE% clean install
    GOTO :EOF

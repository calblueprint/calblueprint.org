#!/bin/bash

# Environment variables
cp config/application.yml.sample config/application.yml

# build docker images
docker-compose build

# create docker-compose compatible db config
cp config/database.yml.docker config/database.yml

docker-compose start
docker-compose run web rake db:create
docker-compose run web rake db:migrate


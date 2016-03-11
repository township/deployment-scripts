#!/bin/bash

docker rm -f `docker ps -aq -f name=township`
source .env
export $(grep "^[^#]" .env | xargs) && cat township_compose.yml | envsubst | docker-compose -f - -p township up -d

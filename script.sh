#!/bin/bash
docker-compose up --build --detach --force-recreate
docker-compose exec pizza-express npm test
curl -s -i 127.0.0.1:8081 | grep "HTTP/1.1 200 OK" || exit 1
docker-compose down
docker push furman91/pizza-express:latest
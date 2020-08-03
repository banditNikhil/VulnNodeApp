#!/bin/bash

cd /home/ubuntu/VulnNodeApp/
docker-compose pull
docker-compose up -d

# docker-compose stop
# docker-compose rm -f
# docker-compose pull   
# docker-compose up -d

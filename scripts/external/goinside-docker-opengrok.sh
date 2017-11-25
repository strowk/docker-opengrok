#!/bin/bash
docker exec -it `docker ps | grep strowk/docker-opengrok | head -1|  awk '{print $1}' ` bash

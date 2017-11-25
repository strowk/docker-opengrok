#!/bin/bash
docker ps | grep 'strowk/docker-opengrok' | awk '{print $1}'  | xargs -I {} docker exec {} catalina.sh stop

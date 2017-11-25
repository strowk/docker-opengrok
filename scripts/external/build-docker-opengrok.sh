#!/bin/bash

docker build \
-t strowk/docker-opengrok \
-t strowk/docker-opengrok:1.1 \
-t strowk/docker-opengrok:1.1-rc17 .


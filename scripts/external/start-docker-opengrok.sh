#!/bin/bash

if [ -z "${SOURCES_FOR_OPENGROK_TO_INDEX}" ] || [ -z "${OPENGROK_DATA_STORAGE}" ] ; then
    echo "please set SOURCES_FOR_OPENGROK_TO_INDEX and OPENGROK_DATA_STORAGE variables"
    exit 1
fi

docker run --rm \
    -v "${SOURCES_FOR_OPENGROK_TO_INDEX}:/src" \
    -v "${OPENGROK_DATA_STORAGE}:/data" \
    -p 8888:8080 \
    strowk/docker-opengrok
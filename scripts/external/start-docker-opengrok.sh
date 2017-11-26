#!/bin/bash


if [ -f /etc/export-my-opegrok-settings.sh ] ; then
    echo "load preconfigured settings"
    . /etc/export-my-opegrok-settings.sh
fi

echo "check required configuration"
if [ -z "${SOURCES_FOR_OPENGROK_TO_INDEX}" ] || [ -z "${OPENGROK_DATA_STORAGE}" ]  ; then
    echo "please set SOURCES_FOR_OPENGROK_TO_INDEX and OPENGROK_DATA_STORAGE variables"
    exit 1
fi

volumes="${OPENGROK_CUSTOM_VOLUMES} -v ${SOURCES_FOR_OPENGROK_TO_INDEX}:/src"
volumes="${volumes} -v ${OPENGROK_DATA_STORAGE}:/data"

echo "look for custom configuration"
if [ -z "${OPENGROK_CONFIGURATION_STORAGE}" ]; then
    echo "skip configuration volume"
else
    if [ ! -f "${OPENGROK_CONFIGURATION_STORAGE}/custom.xml" ] ; then
        cat <<EOF > "${OPENGROK_CONFIGURATION_STORAGE}/custom.xml"
<?xml version="1.0" encoding="UTF-8"?>
<java version="1.8.0_65" class="java.beans.XMLDecoder">
  <object class="org.opensolaris.opengrok.configuration.Configuration" id="Configuration0">
  </object>
</java>
EOF
    fi
    volumes="${volumes} -v ${OPENGROK_CONFIGURATION_STORAGE}:/config"
fi
echo "start docker"
docker run --rm ${volumes} \
    -p 8888:8080 \
    strowk/docker-opengrok

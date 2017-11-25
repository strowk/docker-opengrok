#!/bin/bash

ln -s /data /var/opengrok

wait_for_opengrok_and_reindex(){
    # wait for tomcat startup
    sleep 10
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    reindex.sh
}

wait_for_opengrok_and_reindex &

catalina.sh run
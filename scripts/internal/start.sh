#!/bin/bash
echo "=> Prepare data symlink"
ln -s /data /var/opengrok

wait_for_opengrok_and_reindex(){
    echo "=> Initial wait for catalina to start"
    sleep 10
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    echo "=> Catalina started"
    reindex.sh
}
echo "=> Start reindex callback"
wait_for_opengrok_and_reindex &
echo "=> Start catalina"
catalina.sh run
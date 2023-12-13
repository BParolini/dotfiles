#!/bin/bash

BASEDIR=$(dirname $(realpath "$0"))

if [ $# -eq 0 ]
then
    echo "Copying all firewalld services to /ect/firewalld/services/"
    for service in "$BASEDIR/*.xml"
    do
        /usr/bin/cp -f "$service" /etc/firewalld/services/
    done

    sleep 10

    for service in /etc/firewalld/services/*.xml
    do
        firewall-cmd --add-service="$(basename -s .xml $service)" --permanent
    done

else
    for service in "$@"
    do
        if [ -f "$BASEDIR/$service.xml" ]
        then
            echo "cp \"$BASEDIR/$service.xml\" /etc/firewalld/services/"
            cp "$BASEDIR/$service.xml" /etc/firewalld/services/
        fi
    done

    sleep 10

    for service in "$@"
    do
        if [ -f "$BASEDIR/$service.xml" ]
        then
            echo "firewall-cmd --add-service=\"$service\" --permanent"
            firewall-cmd --add-service="$service" --permanent
        fi
    done
fi

firewall-cmd --reload
systemctl restart firewalld.service

#!/bin/bash

BASEDIR=$(dirname "$0")

if [ $# -eq 0 ]
then
    echo "Copying all firewalld services to /ect/firewalld/services/"
    for service in /etc/firewalld/services/*.xml
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

#firewall-cmd --add-service=plexmediaserver --permanent

#cp ./plexmediaserver.xml /etc/firewalld/services/
#cp ./fantasygrounds.xml /etc/firewalld/services/

#firewall-cmd --zone=public --permanent --add-port=1802/tcp
#firewall-cmd --zone=public --permanent --add-port=1802/udp
#systemctl restart firewalld.service

#!/usr/bin/env sh

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "You must inform the csv file to be notified"
    exit -1
fi

# update da base pela linha de comando mesmo
cat "$1" | sed ':a;N;$!ba;s/\n/,/g;s/,$//g' | xargs -I {} psql -h db.listings.listings-management.private.prod.grupozap.io -p 5432 -d listings -U master -c "update listing set listing_status = 'ACTIVE', portal='GRUPOZAP', portals='{OLX,VIVAREAL,ZAP}', non_activation_reason=null where id in ({})"
​
# o sed serve para deixar o csv com uma única linha separada por ','
# isso faz com que seja enviado apenas uma chamada ao endpoint de notificação
cat "$1" | sed ':a;N;$!ba;s/\n/,/g;s/,$//g' | xargs -P200 -I {} curl -X POST "http://listings-api.grupozap.io/v4/listings/actions/notify" -H "accept: application/json" -H "Content-Type: application/json" -d "[{}]"

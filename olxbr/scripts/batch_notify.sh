#!/usr/bin/env sh

: "${PGPASSWORD:?"No value supplied for PGPASSWORD"}"

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "You must inform the csv file to be notified"
    exit 1
fi

WORK_DIR=$(mktemp -d)
split -dl 10000 -a 3 "$1" "$WORK_DIR/notify_"

(
    cd "$WORK_DIR" || exit 1

    for f in notify_*
    do
        echo "Sending file $f"

        ids=$(sed ':a;N;$!ba;s/\n/,/g;s/,$//g' < "$f")

        # update da base pela linha de comando mesmo
        psql -h db.listings.listings-management.private.prod.grupozap.io -p 5432 \
            -d listings -U master \
            -c "update listing set scores = '[]'::jsonb where id in ($ids)"

        curl_response=$(
            curl -s -w "%{http_code}" \
                -X POST "http://listings-api.grupozap.io/v4/listings/actions/notify-to-crude" \
                -H "accept: application/json" -H "Content-Type: application/json" -d "[$ids]"
        )
        echo "Request response for \"$f\": $curl_response"

        sleep 20
    done
)

rm -rf "$WORK_DIR"

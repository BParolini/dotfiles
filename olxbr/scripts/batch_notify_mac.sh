#!/usr/bin/env sh

for f in notify_*
do
    echo "Sending file $f"
    cat "$f" | \
        xargs -P500 -I {} \
            curl -X POST "http://listings-api.grupozap.io/v4/listings/actions/notify-to-exporter" \
                 -H "accept: application/json" -H "Content-Type: application/json" -d "[{}]"
    sleep 30
done

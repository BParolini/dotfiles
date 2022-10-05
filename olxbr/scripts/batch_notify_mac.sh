#!/usr/bin/env sh

file_name=temp_notify.json

for f in notify_*
do
    gecho "Sending file $f"
    value=$(gcat "$f" | gsed ':a;N;$!ba;s/\n/,/g;s/,$//g')
    gecho -n "[$value]" > "$file_name"

    curl "http://listings-api.grupozap.io/v4/listings/actions/notify" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -d "@$file_name"

    sleep 30
done

rm $file_name

#!/usr/bin/env sh

if [ $# -eq 0 ]
then
    echo "No argument supplied."
    echo "You must inform the csv file name"
    exit 1
fi

mkdir -p ./split_files
gsplit -dl 5000 -a 3 "$1" split_files/notify_

cd ./split_files
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

cd ..
rm -rf ./split_files

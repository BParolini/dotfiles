#!/usr/bin/env bash

if [ $# -lt 4 ]
then
    echo "No arguments supplied."
    echo "Usage: $0 <environment> <action> <file> <line_nr> [wait seconds]"
    exit 1
fi

declare -A environments=(
    ["prod"]="http://listings-api.grupozap.io/v4/listings/actions"
    ["qa"]="http://qa-listings-api.grupozap.io/v4/listings/actions"
)

declare -A actions=(
    ["crude"]="notify-to-crude"
    ["unit"]="notify-to-unit"
    ["exporter"]="notify-to-exporter"
    ["notify"]="notify"
    ["dedup"]="notify-dedup-image?force=true"
)

environment="$1"
action="$2"
file="$3"
line_nr="$4"
endpoint="${environments[$environment]}/${actions[$action]}"
wait_time=${5:-20}

echo "Endpoint: $endpoint"
echo "Wait time: $wait_time"
echo "File: $file - $(wc -l < "$file") lines"
echo "Lines per iteration: $line_nr"
read -p "Deseja continuar? (Y/n): " -n 1 -r confirm && [[ $confirm =~ ^[yYsS]$ ]] || exit 1
echo

WORK_DIR=$(mktemp -d)
split -dl "$line_nr" -a 3 "$file" "$WORK_DIR/notify_"

(
    cd "$WORK_DIR" || exit 1
    echo "Entered $WORK_DIR"
    echo "Files: $(find . -maxdepth 1 -type f | wc -l)"

    for f in notify_*
    do
        echo "Sending file $f"

        ids=$(sed ':a;N;$!ba;s/\n/,/g;s/,$//g' < "$f")

        curl_response=$(
            curl -s -w "%{http_code}" \
                -X POST "$endpoint" \
                -H "accept: application/json" -H "Content-Type: application/json" -d "[$ids]"
        )
        echo "Request response for \"$f\": $curl_response"

        sleep "$wait_time"
    done
)

rm -rf "$WORK_DIR"

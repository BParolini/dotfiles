#!/usr/bin/env zsh

if [ $# -lt 4 ]
then
    gecho "No arguments supplied."
    gecho "Usage: $0 <environment> <action> <file> <line_nr> [wait seconds]"
    exit 1
fi

declare -A environments=(
    ["prod"]="https://listings-api.re-listings.prod.olxbr.io/v4/listings/actions"
    ["qa"]="https://listings-api.re-listings.preprod.olxbr.io/v4/listings/actions"
    ["local"]="http://localhost:8080/v4/listings/actions"
)

declare -A actions=(
    ["crude"]="notify-to-crude"
    ["unit"]="notify-to-unit?forceImageDedup=true&internalEvent=true"
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

gecho "Endpoint: $endpoint"
gecho "Wait time: $wait_time"
gecho "File: $file - $(($(wc -l < "$file"))) lines"
gecho "Lines per iteration: $line_nr"
# read -p "Deseja continuar? (Y/n): " -n 1 -r confirm && [[ $confirm =~ ^[yYsS]$ ]] || exit 1
gecho

WORK_DIR=$(mktemp -d)
gsplit -dl "$line_nr" -a 4 "$file" "$WORK_DIR/notify_"

(
    cd "$WORK_DIR" || exit 1
    gecho "Entered $WORK_DIR"
    total_files=$(($(find . -maxdepth 1 -type f | wc -l)))
    gecho "Files: $total_files"

    index=$((1))
    for f in notify_*
    do
        gecho "Sending file $f ($index/$total_files)"

        ids=$(gsed ':a;N;$!ba;s/\n/,/g;s/,$//g' < "$f")

        gecho "Request: $endpoint"
        body="Body: [$ids]"
        gecho "${body:0:80}"
        curl_response=$(
            curl -s -w "%{http_code}" \
                -X POST "$endpoint" \
                -H "accept: application/json" \
                -H "Content-Type: application/json" \
                -d "[$ids]"
        )
        gecho "Request response for \"$f\": $curl_response"
        gecho

        ((index++))

        sleep "$wait_time"
    done
)

rm -rf "$WORK_DIR"

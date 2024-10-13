#!/usr/bin/env zsh

if [ $# -lt 3 ]
then
    gecho "No arguments supplied."
    gecho "Usage: $0 <environment> <unique> <file>"
    exit 1
fi

declare -A environments=(
    ["prod"]="https://listings-api.re-listings.prod.olxbr.io/v4/listings"
    ["qa"]="https://listings-api.re-listings.preprod.olxbr.io/v4/listings"
    ["local"]="http://localhost:8080/v4/listings"
)

environment="$1"
unique="$2"
file="$3"

index=$((1))
total=$((wc -l < "$file"))

while read id
do
    gecho "Setting listing $id as unique=$unique ($index/$total)"
    endpoint="${environments[$environment]}/$id/unique-unit/$unique"

    curl_response=$(
        curl -s -w "%{http_code}" \
            -X PATCH "$endpoint"
    )
    gecho "Request response for $id: $curl_response"
    gecho

    ((index++))
done < "$file"

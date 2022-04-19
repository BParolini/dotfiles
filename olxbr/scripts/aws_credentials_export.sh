#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Exports AWS variables from SSO credentials

# This script must be run after  `aws sso login`

export AWS_ACCESS_KEY_ID=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.AccessKeyId' --raw-output)
export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.SecretAccessKey' --raw-output)
export AWS_SESSION_TOKEN=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.SessionToken' --raw-output)

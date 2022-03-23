#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Exports AWS variables from SSO credentials

AWS_ACCESS_KEY_ID=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.AccessKeyId' --raw-output)
AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.SecretAccessKey' --raw-output)
AWS_SESSION_TOKEN=$(cat ~/.aws/cli/cache/*.json | jq '.Credentials.SessionToken' --raw-output)

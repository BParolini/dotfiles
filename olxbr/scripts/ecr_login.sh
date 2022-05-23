#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Login to ECR

: "${AWS_REGION:="us-east-1"}"
: "${AWS_ACCOUNT_ID:="073521391622"}"

aws sso login --profile "$1"
aws ecr get-login-password --region $AWS_REGION --profile olxbrazil-crosstech-dev | \
    docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

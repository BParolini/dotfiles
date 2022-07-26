#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs Protocol Buffers (protobuf)


dnf install -y protobuf protobuf-static \
               protobuf-c protobuf-c-compiler \
               protobuf-java protobuf-java-util \
               protobuf-vim

#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Converts flac files to mp3

for a in ./*.flac; do
    ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
done

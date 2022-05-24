#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Converts files to mp3

if [ $# -eq 0 ]
then
    echo "The original file extension is needed"
    exit 1
fi

for a in ./*."$1"
do
    ffmpeg -i "$a" -acodec libmp3lame -ar 48000 -b:a 192k "${a[@]/%$1/mp3}"
done

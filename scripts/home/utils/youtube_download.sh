#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Uses yt-dlp to download best video and audio quality and merges them

if [ $# -eq 0 ]
then
    echo "Either the video or playlist URL is needed"
    exit 1
fi

yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$1"

#!/bin/bash 
find . -type f -iname "*.m4a" \
     -exec bash -c \
     'FILE="$1"; ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.m4a}.mp3";'\
     _ '{}' \;

#!/bin/bash 

for FILE in "$@"; do
    ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE//.*/}.mp3"
done

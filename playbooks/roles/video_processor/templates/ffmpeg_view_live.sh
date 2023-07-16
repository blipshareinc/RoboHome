#!/bin/sh

if [ -z "$1" ]; then
    echo "ERROR: Provide ip address."
    exit
elif [ -z "$2" ]; then
    echo "ERROR: Provide port number."
    exit
fi

ffmpeg -i rtsp://$1:$2/live -c copy output.mp4

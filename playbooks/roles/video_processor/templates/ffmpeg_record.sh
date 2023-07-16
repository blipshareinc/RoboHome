#!/bin/sh

if [ -z "$1" ]; then
    echo "ERROR: HW device id is missing as a user parameter."
    exit
fi

sudo ffmpeg -f alsa -i hw:$1 -f video4linux2 -i /dev/video0 -t 2:00 -segment_time 01:00.00 -c:v libx264 -c:a aac -f segment -vf format=yuv420p out_%003d.mp4


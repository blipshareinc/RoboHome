#!/bin/sh

if [ -z "$1" ]; then
    echo "ERROR: HW device id is missing as a user parameter."
    exit
fi

sudo ffmpeg -f alsa -i hw:$1 -f video4linux2 -i /dev/video0 -input_format mjpeg -video_size 1280x720 -r 30 -thread_queue_size 1024 -vcodec libx264 -preset ultrafast -crf 20 -s hd720 -vf format=yuv420p -profile:v main -f mpegts - | vlc -I dummy - --sout='#rtp{sdp=rtsp://:8554/live} --sout-all --sout-keep'


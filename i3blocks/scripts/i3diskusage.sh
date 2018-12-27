#!/bin/sh

case $BLOCK_BUTTON in 
    1) #notify-send -t 4000 "$(ps axch -o cmd:15,%mem --sort=-%mem | head)"
    ;;
    2) #echo "Right click" 
        ;;
esac

df -h | awk '/sda1/ { print $4 "/" $2 }'

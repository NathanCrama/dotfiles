#!/bin/sh

case $BLOCK_BUTTON in 
    1) notify-send -t 4000 "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)" ;;
    2) echo "Right click" ;;
esac

mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $13"%" }'

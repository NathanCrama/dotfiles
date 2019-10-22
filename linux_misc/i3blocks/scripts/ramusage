#!/bin/sh

case $BLOCK_BUTTON in 
    1) notify-send -t 4000 "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
    2) echo "Right click" ;;
esac

free -h | awk '/^Mem:/ {print $3 "/" $2}' | sed 's/i/B/g'

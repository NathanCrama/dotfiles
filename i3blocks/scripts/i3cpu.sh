#!/bin/sh

case $BLOCK_BUTTON in 
    1) notify-send -t 4000 "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)" ;;
    2) echo "Right click" ;;
esac

idle=$(top -b -n 1 | sed 's/,/ /g; s/:/ /g;' | awk '/^%Cpu0/ {print $8}')
used=$(echo 100 - $idle | bc)
output=$(printf "%0.1f\n" $used)
echo "$output%"

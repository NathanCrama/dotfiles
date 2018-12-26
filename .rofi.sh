#!/bin/sh 

bg_color=#333333
text_color=#fc8800
htext_color=#ffffff

rofi -show run -lines 5 -eh 2 -padding 40 -opacity "85" -bw 0 -color-window "$bg_color, $bg_color, $bg_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Hasklig 16" -location 0 -separator-style none -hide-scrollbar

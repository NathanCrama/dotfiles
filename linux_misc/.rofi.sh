#!/bin/sh 

bg_color=#1e1e1e
text_color=#e44138
htext_color=#ffffff

rofi -show run -lines 5 -eh 2 -padding 40 -opacity "85" -bw 0 -color-window "$bg_color, $bg_color, $bg_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Hasklig 13" -location 0 -separator-style none -hide-scrollbar

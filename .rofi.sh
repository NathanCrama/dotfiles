#!/bin/sh 

bg_color=#151515
text_color=#9d403c
htext_color=#ffffff

rofi -show run -lines 5 -eh 2 -padding 40 -opacity "85" -bw 0 -color-window "$bg_color, $bg_color, $bg_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Hasklig 13" -location 0 -separator-style none -hide-scrollbar

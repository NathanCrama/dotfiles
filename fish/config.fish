ufetch
brightnessctl --device='tpacpi::kbd_backlight' set 2 | grep "Current brightness:" >> /dev/null

function fish_prompt
    powerline-shell --shell bare $status
end

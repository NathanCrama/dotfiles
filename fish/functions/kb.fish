function kb
	echo "sudo chmod 777 /sys/class/leds/tpacpi::kbd_backlight/brightness"
brightnessctl --device='tpacpi::kbd_backlight' set $argv[1] | grep "Current brightness:"
end

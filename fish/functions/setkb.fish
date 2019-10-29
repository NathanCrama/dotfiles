function setkb
	set lang $argv[1]
    if test "$lang" == "fr"
    set lang "be"
end
echo "Set keyboard layout: $lang"
setxkbmap $argv[1]
xmodmap $HOME/dotfiles/.speedswapper
end

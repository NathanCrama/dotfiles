# COREUTILS

alias ls='ls -AlGH --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias make='time nice make -j $(nproc)'
alias pmake='time nice make -j 4 --load-average=4'

alias rm='rm -v'

# PACKAGE MANAGEMENT
alias pacman='yay'
alias yy='yay --noconfirm'

# GIT 
alias gs='git status'
alias gl='git --no-pager log --oneline --decorate=short --pretty=oneline -n20'
alias gb='git branch'
alias gm='git merge'
alias gac='git add . && git commit -m' # + commit message
alias gp='git push' # + remote & branch names
gipu() {
    git add -A && git commit -m $1 $2 $3 $4 && git push 
}

md(){
	pandoc $1 | w3m -T text/html
}

fix() {
    audio="audio"
    keyboard="keyboard"
    lock="lock"
    case $1 in
        $audio) 
            echo "puseaudio && ~/toggle_sound.sh"
            echo "Try plugging and unplugging an audio jack"
            ;;
        $keyboard)
            echo "kbdlight"
            ;;
        $lock)
            echo "xautolock -enable | -disable"
            ;;
        *)
            echo "Unknown option. Options:"
            echo "$audio"
            echo "$keyboard"
            echo "$lock"
            ;;
    esac
}

alias neofetch="neofetch --ascii_distro manjaro --ascii_colors 6"
# alias neofetch="neofetch --ascii_distro arch"

alias ping1="ping 1.1.1.1"
pingl() {
    ping -c 10 192.168.1.$1
}

alias py='python3'
alias pyp='pip3'

alias PluginInstall='vim +PluginInstall +qall'

kb(){
    # Keyboard brightness
    brightnessctl --device='tpacpi::kbd_backlight' set $1
}

setkb() {
    #keyboard layout
    lang=$1
    if [[ $lang == "fr" ]]; then
        lang="be"
    fi
    echo $lang
    setxkbmap $1
    xmodmap .speedswapper
}

alias esc='xmodmap .speedswapper'

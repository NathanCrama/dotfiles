# COREUTILS
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias pmake='time nice make -j $(nproc) --load-average=$(nproc)'

alias rm='rm -v'

# TMUX
alias tmux="tmux -2"
alias kill-tmux="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
alias kimux='tmux kill-session'

# Nerdy utils
alias sc='scim'

# GIT 
alias gs='git status'
alias gl='git --no-pager log --oneline --decorate=short --pretty=oneline -n20'
alias gb='git branch'
alias gm='git merge'
alias gac='git add -A && git commit -m ' # + commit message
alias gp='git push' # + remote & branch names
alias force-push='git add . && git commit -m "Force push" && git push'
alias update-repo='git reset --hard && git pull --rebase'
gipu() {
    git add -A && git commit -m $1 $2 $3 $4 && git push 
}

# MISC
alias browse='w3m duckduckgo.com'
alias ping1="ping 1.1.1.1"

pingl() {
    ping -c 10 192.168.1.$1
}

md(){
	pandoc $1 | w3m -T text/html
}


# DEV SHORTCUTS
alias py='python3'
alias pyp='pip3'
alias PluginInstall='vim +PluginInstall +qall'
<<<<<<< HEAD
alias gg="g++ --std=c++11"
=======
alias gg="g++-9 --std=c++11"
>>>>>>> 21c671507e33588e594b3a4b3f174f575d018a9c

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xvf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    alias ls='ls -Alh --color=auto'
    alias pacman='yay'
    alias yy='yay --noconfirm'
    alias yaourt='yay'

    alias esc='xmodmap $HOME/dotfiles/.speedswapper'

    alias neofetch="neofetch --ascii_colors 1"
    alias screenfetch="screenfetch -c 1,7"
    # alias neofetch="neofetch --ascii_distro arch"

    alias xup="xrdb ~/.Xresources"

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

    kb(){
        # Keyboard brightness
        echo "sudo chmod 777 /sys/class/leds/tpacpi::kbd_backlight/brightness"

        brightnessctl --device='tpacpi::kbd_backlight' set $1
    }

    setkb() {
        #keyboard layout
        lang=$1
        if [[ $lang == "fr" ]]; then
            lang="be"
        fi
        echo "Set keyboard layout: $lang"
        setxkbmap $1
        xmodmap $HOME/dotfiles/.speedswapper
    }

    accents() {
        echo "é"
        echo "ç"
        echo "â ê î ô û"
        echo "à è ù"
        echo "ë ï ü"
    }

elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Use MacVim - for autocompletion
	alias vim='mvim -v'

    alias l='ls -AF1GH'
    alias ll=' ls -H'
    alias ls='ls -AlGhH'

	alias iphone='open -a Simulator & disown'
	alias pixel='~/Library/Android/sdk/tools/emulator -avd Pixel_2_XL_API_28 & disown'
	alias cdmob='cd ~/mobULIS/mobulis-xamarin && git status'
	alias emulator='~/Library/Android/sdk/tools/emulator'
	alias sshmob='ssh u171837@serv737.segi.ulg.ac.be'

	# C++
    alias ctags="`brew --prefix`/bin/ctags"
    alias gcc="/usr/local/Cellar/gcc/9.2.0_1/bin/gcc-9"
    alias g++="/usr/local/Cellar/gcc/9.2.0_1/bin/g++-9"
fi



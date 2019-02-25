export PS1="\w $ \[$(tput sgr0)\]"

alias rm='rm -v'
alias hcat='highlight --force'

alias network='arp -a'
alias ping1='ping 1.1.1.1'

# Git
alias g='git'
alias gs='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias gm='git merge'
alias gac='git add . && git commit -m' # + commit message
alias gp='git push' # + remote & branch names
alias force-push='git add . && git commit -m "Force push" && git push'
alias update-repo='git reset --hard && git pull --rebase'

# Python 
alias pyp='python3 -m pip'
alias py='python3'

# C++
alias gpp='g++'

# Random
alias pipes='pipes.sh'
alias cr='cargo run'

md(){
	pandoc $1 | w3m -T text/html
}

#OSX
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Use MacVim - for autocompletion
    alias ls='ls -AhlGF'
    alias vim='mvim -v'
    alias iphone='open -a Simulator & disown' 
    alias pixel='~/Library/Android/sdk/tools/emulator -avd Pixel_2_XL_API_28 & disown'
    alias cdmob='cd ~/mobULIS/mobulis-xamarin && git status'
    alias emulator='~/Library/Android/sdk/tools/emulator'
	alias sshmob='ssh u171837@serv737.segi.ulg.ac.be'

    export ANDROID_HOME='~/Library/Android/sdk'
    export ANDROID_SDK_ROOT=$ANDROID_HOME
	export PATH=$PATH:/Users/u171837/scripts/
fi

#LINUX
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
	alias ls='ls -AhlGF --color=auto'
	alias pacman='sudo pacman'
	alias pm='sudo pacman -Sy --noconfirm'

    neofetch
fi

# TMUX
alias tmux="TERM=screen-256color-bce tmux"
alias kill-tmux="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"


alias InstallPlugin='vim +PluginInstall +qall'

alias cr='clear && cargo run'
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi



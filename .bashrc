export PS1="\w $ \[$(tput sgr0)\]"

alias ls='ls -AhlGF'
alias rm='rm -v'

alias iphone='open -a Simulator & disown' 
alias pixel='~/Library/Android/sdk/tools/emulator -avd Pixel_2_XL_API_26 & disown'
alias emulator='~/Library/Android/sdk/tools/emulator'

alias network='arp -a'
alias ping1='ping 1.1.1.1'

export ANDROID_HOME=/Users/u171837/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

alias clear='clear; source ~/.bashrc'

# Git
alias gs="git status"
alias gac="git add . && git commit -m" # + commit message
alias gp="git push" # + remote & branch names

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Use MacVim - for autocompletion
    alias vim='mvim -v'
fi

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

# neofetch

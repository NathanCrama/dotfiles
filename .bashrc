export PS1="\w $ \[$(tput sgr0)\]"

alias ls='ls -AhlGF'
alias rm='rm -v'
alias mobcommit='~/commit-script-mobulis/mobcommit.sh'
export M2_HOME=/Applications/apache-maven-3.1.1
export PATH=$PATH:$M2_HOME/bin

alias iphone='open -a Simulator'
alias pixel='~/Library/Android/sdk/tools/emulator -avd Pixel_2_XL_API_26 & disown'
alias emulator='~/Library/Android/sdk/tools/emulator'

alias network='arp -a'
alias ping1='ping 1.1.1.1'

export ANDROID_HOME=/Users/u171837/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

alias clear='clear; source ~/.bashrc'
alias odroid='192.168.1.44'

# Git
alias gs="git status"
alias gac="git add . && git commit -m" # + commit message
alias gp="git push" # + remote & branch names

# Use MacVim - for autocompletion
alias vim='mvim -v'
alias cr='clear && cargo run'

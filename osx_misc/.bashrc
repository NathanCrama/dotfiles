function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

if [[ -f ~/dotfiles/bash/.bash_aliases ]]; then
    . ~/dotfiles/bash/.bash_aliases
fi

if [[ -f ~/dotfiles/bash/.bashrc_common ]]; then
    . ~/dotfiles/.bashrc_common
fi

alias network='arp -a'


# TMUX
# Launch tmux with terminal
# if [[ ! $TERM =~ screen  ]]; then
# 	    exec tmux -2
# fi

# HSTR configuration - add this to ~/.bashrc
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


alias shebang='echo "#!/usr/bin/env bash"'
alias svg='rsvg-convert -h 200'

neofetch

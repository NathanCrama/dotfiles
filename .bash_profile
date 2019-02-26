export PATH="$HOME/.fastlane/bin:$PATH"
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/u171837/.sdkman"
[[ -s "/Users/u171837/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/u171837/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.fastlane/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.flutter_sdk/flutter/bin"

export ANDROID_HOME='/Users/u171837/Library/Android/sdk'
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$PATH":"$HOME/.pub-cache/bin"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/u171837/.sdkman"
[[ -s "/Users/u171837/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/u171837/.sdkman/bin/sdkman-init.sh"

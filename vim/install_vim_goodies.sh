already_installed(){
    echo "$@" "already installed. Skipping install."
}

PLUG_VIM="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ];
then
    curl -fLo "$PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else 
    already_installed "Vim-Plug"
fi


install_shellcheck() {
    INSTALL_CMD=""
    if [ "$(uname)" = "Darwin" ];
    then
        echo "MacOS detected."
        INSTALL_CMD="brew install"
    elif [ "$(uname)" = "Linux" ];
    then
        DISTRO="$(awk '{ print $1 }' < /etc/issue | xargs)"
        echo "$DISTRO detected."
        if [ "$DISTRO" = "Ubuntu" ] || [ "$DISTRO" = "Debian" ];
        then
            INSTALL_CMD="sudo apt install"
        elif [ "$DISTRO" = "Arch" ] || [ "$DISTRO" = "Manjaro" ];
        then
            INSTALL_CMD="sudo pacman -Sy"
        fi
    fi

    $INSTALL_CMD shellcheck
}

if ! hash shellcheck 2>/dev/null; then
    install_shellcheck
else 
    already_installed "Shellcheck"
fi

if hash pip3 2>/dev/null; then
    if ! hash flake8 2>/dev/null; then
        sudo pip3 install 'python-language-server[all]'
        sudo pip3 install flake8
    else 
        already_installed flake8
    fi
else 
    echo "ERROR: pip3 not installed."
    exit 1
fi

# Check if rustup is installed
if hash rustup 2>/dev/null; then
    rustup component add rls rust-analysis rust-src
else 
    echo "ERROR: rustup not installed."
    exit 1
fi

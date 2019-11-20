PLUG_VIM="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ];
then
    curl -fLo "$PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else 
    echo "Vim-Plug installation already detected at '$PLUG_VIM'. Skipping install."
fi

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

sudo pip3 install flake8
rustup component add rls rust-analysis rust-src

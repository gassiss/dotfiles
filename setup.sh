#! /bin/bash

echo "What is your Windows username? Necessary to install the WSLTTY theme"

read WINUSER

DOTFILES=$HOME/.dotfiles

# Update packages
sudo apt-get update && sudo apt-get upgrade -y

# Add Neovim unstable repo
sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update --> Uncomment this after removing the comment below

# Ubuntu 20.04 has a bug that will prevent installing node
# This fixes it
# Remove when bug is fixed
# Issue: https://github.com/microsoft/WSL/issues/5125
sudo add-apt-repository ppa:rafaeldtinoco/lp1871129
sudo apt update
sudo apt install -y --allow-downgrades \
  libc6=2.31-0ubuntu8+lp1871129~1 \
  libc6-dev=2.31-0ubuntu8+lp1871129~1 \
  libc-dev-bin=2.31-0ubuntu8+lp1871129~1
sudo apt-mark hold libc6

# Node 12.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Install deps
sudo apt-get install neovim zsh nodejs build-essential

# Enables vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo npm install -g neovim

# Enables zsh-syntax-highlighting
mkdir -p $DOTFILES/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOTFILES/zsh/plugins/zsh-syntax-highlighting

# Enables gruvbox theme for WSLTTY
WSLTTY_THEME_PATH="/mnt/c/Users/$WINUSER/AppData/Roaming/wsltty/themes"
WSLTTY_THEME="$WSLTTY_THEME_PATH/gruvbox-wsltty-theme"

if [ ! -f "$WSLTTY_THEME" ]; then
  mkdir -p $WSLTTY_THEME_PATH
  cp $DOTFILES/gruvbox-wsltty-theme $WSLTTY_THEME
fi

# Enabling gitmux
curl -oL $HOME/gitmux.tar.gz https://github.com/arl/gitmux/releases/download/v0.6.0/gitmux_0.6.0_linux_amd64.tar.gz
tar -xvzf $HOME/gitmux.tar.gz
sudo mv $HOME/gitmux /usr/bin/gitmux

# Makes symbolic links to dotfiles
mkdir -p $HOME/.config/nvim
ln -s $DOTFILES/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

# Make zsh default shell
chsh -s "$(which zsh)"

echo "Install WSLTTY manually: https://github.com/mintty/wsltty"

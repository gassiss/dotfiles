#! /bin/bash

echo "What is your Windows username? Necessary to install the WSLTTY theme"

read WINUSER

DOTFILES=$HOME/.dotfiles

# Update packages
sudo apt-get update && sudo apt-get upgrade -y

# Add Neovim unstable repo
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update

# Node 12.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Install deps
sudo apt-get install -y neovim zsh nodejs build-essential

# Enables vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo npm install -g neovim

# Enables zsh-syntax-highlighting
mkdir -p $DOTFILES/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOTFILES/zsh/plugins/zsh-syntax-highlighting

# Enables gruvbox theme for WSLTTY
WSLTTY_CONFIG_PATH="/mnt/c/Users/$WINUSER/AppData/Roaming/wsltty"
WSLTTY_THEME="$WSLTTY_CONFIG_PATH/themes/gruvbox-wsltty-theme"

if [ ! -f "$WSLTTY_THEME" ]; then
  mkdir -p "$WSLTTY_THEME_PATH/themes"
  cp $DOTFILES/gruvbox-wsltty-theme $WSLTTY_THEME
fi

# WSLTTY config
cp $HOME/.dotfiles/wslttyconfig $WSLTTY_CONFIG_PATH/config

# Enabling gitmux
curl -o $HOME/gitmux.tar.gz -L https://github.com/arl/gitmux/releases/download/v0.6.0/gitmux_0.6.0_linux_amd64.tar.gz
tar -xvzf $HOME/gitmux.tar.gz
sudo mv $HOME/gitmux /usr/bin/gitmux
rm $HOME/gitmux.tar.gz

# Makes symbolic links to dotfiles
mkdir -p $HOME/.config/nvim
ln -s $DOTFILES/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
ln -s $DOTFILES/nvim/init.vim $HOME/.config/nvim/init.vim

# Make zsh default shell
chsh -s "$(which zsh)"

echo "Install WSLTTY manually: https://github.com/mintty/wsltty"

# dotfiles
Steal anything you want.

Run `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git` inside `zsh/plugins` folder.

Also put these in your `.zprofile` to override the `zsh` and `nvim` folder configuration defaults:

```
export ZDOTDIR="$HOME/.dotfiles/zsh"
export XDG_CONFIG_HOME="$HOME/.dotfiles"
```

Run this to enable `vim-plug`. Go [here](https://github.com/junegunn/vim-plug) if it doesn't work:

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Neovim's CoC plugin requires Neovim 0.3+. Ubuntu official repos are @ 0.2, add the PPA below to grab the latest:

```
sudo add-apt-repository ppa:neovim-ppa/stable
```


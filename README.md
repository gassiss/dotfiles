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

For [WSLTTY Gruvbox Theme](https://github.com/morhetz/gruvbox-contrib/blob/master/mintty/gruvbox.minttyrc) (with modified background to match Vim's). Put this in `users/$USER/AppData/Roaming/wsltty/themes`

```
ForegroundColour=235,219,178
BackgroundColour=38,38,38
CursorColour=253,157,79
Black=40,40,40
BoldBlack=146,131,116
Red=204,36,29
BoldRed=251,73,52
Green=152,151,26
BoldGreen=184,187,38
Yellow=215,153,33
BoldYellow=250,189,47
Blue=69,133,136
BoldBlue=131,165,152
Magenta=177,98,134
BoldMagenta=211,134,155
Cyan=104,157,106
BoldCyan=142,192,124
White=168,153,132
BoldWhite=235,219,178
```


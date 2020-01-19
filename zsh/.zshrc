# sets up git branch in the prompt. As (branch) or (branch|action)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{3}(%f%F{1}%b%F{3}|%F{1}%a%F{3})%f '
zstyle ':vcs_info:*' formats       \
    '%F{3}(%f%F{1}%b%F{3})%f '
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
  vcs_info  
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}"
  fi
}
GITBRANCH=$'$(vcs_info_wrapper)'

# Enable colors and change prompt. Explanation of the cryptic string:
# %B %b starts and resets bold
# %{} expands to set color
# %~ expands to current dir
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$GITBRANCH$%b "

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Case insensitive auto/tab complete
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# change cursor shape for different vi modes
# '\e[2 q' -> non blinking block
# '\e[6 q' -> non blinking beam
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 == 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
 zle -K viins 
 echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q'
preexec() { echo -ne '\e[6 q' ;}

# edit in line with vim with ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# load aliases
[ -f "$HOME/.dotfiles/aliasrc" ] && source "$HOME/.dotfiles/aliasrc"

# load zsh highlighting plugin. Must be last in the file
source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

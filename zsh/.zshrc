# sets up git branch in the prompt. As (branch) or (branch|action)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{3}(%f%F{1}%b%F{3}|%F{1}%a%F{3})%f'
zstyle ':vcs_info:*' formats       \
    '%F{3}(%f%F{1}%b%F{3})%f'
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
PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%3~%{$fg[red]%}]%{$reset_color%}$GITBRANCH$%b "
# RPROMPT="$GITBRANCH$USER@$HOST"

# History stuff
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt SHARE_HISTORY # sets global history
setopt HIST_VERIFY # doesnt submit command when searching with ^r

# Case insensitive auto/tab complete
autoload -U +X compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

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

command -v kubectl &> /dev/null && source <(kubectl completion zsh)

export FZF_DEFAULT_COMMAND='rg --files'

# load zsh history fzf plugin
# credits: https://github.com/joshskidmore/zsh-fzf-history-search
fzf_history_search() {
  setopt extendedglob
  candidates=(${(f)"$(fc -li -1 0 | fzf +s +m -x -e -q "$BUFFER")"})
  local ret=$?
  if [ -n "$candidates" ]; then
    BUFFER="${candidates[@]/(#m)*/${${(As: :)MATCH}[4,-1]}}"
    BUFFER="${BUFFER[@]/(#b)(?)\\n/$match[1]
}"
    zle vi-fetch-history -n $BUFFER
  fi
  zle reset-prompt
  return $ret
}

autoload fzf_history_search
zle -N fzf_history_search

bindkey '^r' fzf_history_search

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin/:$HOME/.local/bin

ssht() {
  ssh -N -L "${1}:localhost:${1}" work
}

# passes !! to watch -n1
w!() {
  lastcmd=$(fc -l -1)
  watch -n1 "${(z)${lastcmd#*  }}"
}
zle -N w!
bindkey '^[?' w!

# expand alias with TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true

# load zsh auto suggestions plugin
# [ -d "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions" ] && source "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# bindkey '^k' autosuggest-accept

# load zsh highlighting plugin. Must be last in the file
[ -d "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting" ] && source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


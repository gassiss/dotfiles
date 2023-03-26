# sets up git branch in the prompt. As (branch) or (branch|action)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{14}%b%F{2}|%F{14}%a%f '
zstyle ':vcs_info:*' formats       \
    '%F{14}%b%f '
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}"
  fi
}
GITBRANCH=$'$(vcs_info_wrapper)'

get_pwd() {
  pw=$(echo $PWD | sed 's+/home/gassis+~+')
  gr=$(git --no-optional-locks rev-parse --show-toplevel 2> /dev/null)
  grs=(${(@s:/:)gr})
  git_root=$grs[-1]
  parts=(${(@s:/:)pw})
  found=0
  pw=""
  for (( i = 1; i < $#parts; i++ )); do
    el=$parts[i]
    if [[ $found == 0 && $el == $git_root ]]; then
      pw+="$git_root%{$fg[green]%}"
      found=1
    else
      pw+=$(echo $el | sed 's+\(\.\?.\).*+\1+')
    fi
    pw+="/"
  done
  pw+="%B$parts[-1]%b"
  echo $pw
}
NICE_PwD=$'$(get_pwd)'

autoload -U colors && colors
PS1="%{$fg[green]%}$NICE_PwD %{$reset_color%}$GITBRANCH❱ "
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

# edit in line with vim with alt-ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line

# load aliases
[ -f "$HOME/.dotfiles/aliasrc" ] && source "$HOME/.dotfiles/aliasrc"

command -v kubectl &> /dev/null && source <(kubectl completion zsh)

FD_OPTIONS='--follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd -uu --type f --type l $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_DEFAULT_OPTS='--reverse --bind="ctrl-y:execute-silent(echo {+} | wl-copy),ctrl-a:select-all+accept"'

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin/:$HOME/.local/bin

# passes !! to watch -n1
w!() {
  lastcmd=$(fc -l -1)
  watch -n1 "${(z)${lastcmd#*  }}"
}
zle -N w!
bindkey '^[?' w!

wl-kill-line () {
  zle kill-line   # `kill-line` is the default ctrl+k binding
  echo -n $CUTBUFFER | wl-copy
}

zle -N wl-kill-line  # register our new function

bindkey '^K' wl-kill-line  # change the ctrl+k binding to use our new function

bindkey '^H' backward-delete-word # c-bs to delete word like everywhere else

# force emacs for line editing
bindkey -e

# expand alias with TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true

# load zsh highlighting plugin. Must be last in the file
[ -d "$HOME/.dotfiles/zsh/plugins/fzf-tab" ] && source "$HOME/.dotfiles/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"

# load zsh highlighting plugin. Must be last in the file
[ -d "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting" ] && source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source "$HOME/.grafanarc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

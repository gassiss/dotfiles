# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

command -v kubectl &> /dev/null && source <(kubectl completion zsh)

FD_OPTIONS='--follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd -uu --type f --type l $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
export FZF_DEFAULT_OPTS="
  --reverse
  --bind='ctrl-q:select-all+accept,f4:toggle-preview,ctrl-d:preview-page-down,ctrl-u:preview-page-up'
  --preview 'bat {}' --preview-window hidden:wrap"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin/:$HOME/.local/bin
export PATH=$PATH:$HOME/wezterm/target/release

autoload -U select-word-style
select-word-style bash

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

function load {
  file="$HOME/.dotfiles/zsh/$1"
  [ -f $file ] && source $file
}
load bindkey.zsh
load alias.zsh

function load_plugin {
  readonly plugin_file=${1:?"must specify plugin file to load"}

  file="$HOME/.dotfiles/zsh/plugins/$plugin_file"
  if [ -f "$file" ]; then
    source $file
    return
  fi

  readonly plugin_repo=${2:?"must specify plugin repo"}
  git -C "$HOME/.dotfiles/zsh/plugins" clone "https://github.com/$plugin_repo.git"
  load_plugin $plugin_file
}

load_plugin "fzf-tab/fzf-tab.plugin.zsh" "Aloxaf/fzf-tab"
load_plugin "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "zsh-users/zsh-syntax-highlighting"
load_plugin "powerlevel10k/powerlevel10k.zsh-theme" "romkatv/powerlevel10k"

source "$HOME/.grafanarc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/local/share/nvm/init-nvm.sh

source /opt/local/share/fzf/shell/key-bindings.zsh
source /opt/local/share/fzf/shell/completion.zsh

[[ ! -f ~/.dotfiles/zsh/p10k.zsh ]] || source ~/.dotfiles/zsh/p10k.zsh

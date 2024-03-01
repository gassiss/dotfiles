if not status is-interactive
    return
end

function end-of-line-or-accept-autosuggestion
    set -l line (commandline -L)
    set -l cmd (commandline)
    set -l cursor (commandline -C)
    if test (string length -- $cmd[$line]) = $cursor
        commandline -f accept-autosuggestion
    else
        commandline -f end-of-line
    end
end

bind \ce end-of-line-or-accept-autosuggestion
bind \cb backward-word
bind \cf forward-word

set -l FD_OPTIONS '--follow --exclude .git --exclude node_modules'
set -gx FZF_DEFAULT_COMMAND "fd --type f --type l $FD_OPTIONS"
set -gx FZF_CTRL_T_COMMAND "fd -uu --type f --type l $FD_OPTIONS"
set -gx FZF_ALT_C_COMMAND "fd --type d $FD_OPTIONS"
set -gx FZF_CTRL_R_OPTS "
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {1..} | pbcopy)+abort'"
set -gx FZF_DEFAULT_OPTS "
  --reverse
  --bind='ctrl-q:select-all+accept,f4:toggle-preview,ctrl-d:preview-page-down,ctrl-u:preview-page-up'
  --preview 'bat {}' --preview-window hidden:wrap"

set -gx GOPATH "$HOME/go"
set -gxa PATH '/usr/local/go/bin'
set -gxa PATH "$GOPATH/bin"
set -gxa PATH "$HOME/.local/bin"
set -gxa PATH "$HOME/fzf/bin"
set -gxa PATH "$HOME/wezterm/target/release"
set -gxa PATH "$HOME/.nvm/versions/node/v18.17.0/bin"
set -gxa PATH "$HOME/.dotfiles/bin"

if test -z (pgrep ssh-agent)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gco 'git checkout'
abbr --add gc 'git commit'
abbr --add gcn 'git commit --no-verify'
abbr --add gp 'git push'
abbr --add gl 'git log --graph --oneline --decorate'
abbr --add g 'git'
abbr --add gw 'git worktree'
abbr --add ll 'ls -la --color'
abbr --add v 'nvim'
abbr --add t 'tmux'
abbr --add k 'kubectl'

function tldr
  curl cheat.sh/$argv | bat
end

function ktgl
  if set -q _rprompt_kubectl;
    set --erase _rprompt_kubectl
  else
    set -gx _rprompt_kubectl (kubectl config view --minify -o json | jq '.contexts[] | .name, .context.namespace' | tr -d '\n' | sed "s/\"\"/\//" | tr -d '"')
  end
end

if set -q SSH_CLIENT;
  __setup_ssh_config
end

if test -e /cat/issue && test (cat /etc/issue | head -n1 | cut -d ' ' -f1) = "Debian"
  __setup_debian_config
end

if test -e ~/.grafana.fish
    source ~/.grafana.fish
end

fzf_key_bindings

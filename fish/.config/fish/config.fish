if not status is-interactive
    return
end

bind \ce end-of-line-or-accept-autosuggestion
bind \cb backward-word
bind \cf forward-word

set -l FD_OPTIONS '--follow --exclude .git --exclude node_modules --exclude .vim'
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
set -gxa PATH "$HOME/.dotfiles/bin"

set -gxa CDPATH "$HOME"

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
abbr --add kcc 'kubectl config use-context'
abbr --add kcn 'kubectl config set-context --current --namespace'

function kw
    kubectl-prompt enable
end

fzf_key_bindings

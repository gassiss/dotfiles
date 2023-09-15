# # force emacs for line editing
bindkey -e

bindkey ^F forward-word
bindkey ^B backward-word
bindkey ^Q push-line
bindkey ^O get-line
bindkey ^V yank-pop
bindkey ^U backward-kill-line


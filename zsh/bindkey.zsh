# # force emacs for line editing
bindkey -e

bindkey ^F forward-word
bindkey ^B backward-word
bindkey ^Q push-line
bindkey ^O get-line
bindkey ^V yank-pop
bindkey ^U backward-kill-line

wl-kill-line () {
  zle kill-line   # `kill-line` is the default ctrl+k binding
  echo -n $CUTBUFFER | pbcopy
}

zle -N wl-kill-line  # register our new function

bindkey '^K' wl-kill-line

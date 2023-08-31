#!/bin/bash

# file=`mktemp`.sh
# tmux capture-pane -pS -32768 > $file
# tmux new-window -n:mywindow "$EDITOR '+ normal G $' $file"

search_regex = ""
if [[ $1 == "hash" ]]; then
  search_regex="[0-9a-f]{5,40}"
elif [[ $1 == "url" ]]; then
  search_regex="(https?://|git@|git://|ssh://|ftp://|file:///)[[:alnum:]?=%/_.:,;~@!#$&()*+-]*"
elif [[ $1 == "ip" ]]; then
  search_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}"
elif [[ $1 == "digit" ]]; then
  search_regex="[[:digit:]]+"
fi

tmux copy-mode
tmux send -X search-backward "$search_regex"

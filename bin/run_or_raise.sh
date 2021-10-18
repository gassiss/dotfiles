#!/usr/bin/env bash

CMD=$1
WIN_CLASS=$2
CUR=$(pfw)

# check for existing windows

WIN_LIST=$(wmctrl -lpx | awk '{print $1" "$4}' | grep $WIN_CLASS)

if [[ $WIN_LIST == "" ]]; then
  $CMD
  exit 0
fi

WIN_LIST=$(echo "$WIN_LIST" | grep -v $CUR)

[[ $WIN_LIST == "" ]] && exit 0

WIN_COUNT=$(echo "$WIN_LIST" | wc -l)

if (( $WIN_COUNT == 1 )); then
  wmctrl -i -a $(echo $WIN_LIST | awk '{print $1}')
fi

# echo $WIN_LIST

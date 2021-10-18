#!/usr/bin/env bash

wmv -a 1280 720 $(pfw)

if [[ $1 == "resize" ]]; then
  CUR=$(pfw)
  X_POS=$(wattr x $CUR)
  Y_POS=$(wattr y $CUR)
  WW=$(wattr w $CUR)
  WH=$(wattr h $CUR)
  wrs $(expr 1280 - $WW) $(expr 720 - $WH) $CUR
  wmv -a 1280 720 $(pfw)
fi

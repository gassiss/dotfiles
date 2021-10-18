#!/usr/bin/env bash

CUR=$(pfw)
X_POS=$(wattr x $CUR)

if [[ $X_POS < 2560 ]]; then
  wmv 2560 0 $CUR
else
  wmv -2560 0 $CUR
fi


#!/usr/bin/env bash

if [[ $# != 4 ]]; then
  exit 0
fi

TOP=$1
RIGHT=$2
BOTTOM=$3
LEFT=$4

CUR=$(pfw)
WW=$(wattr w $CUR)
WH=$(wattr h $CUR)
X_POS=$(wattr x $CUR)
Y_POS=$(wattr y $CUR)

# Don't allow resizing bigger than screen sizes (do nothing in this case)
if (( $WW > 2560)); then
  RIGHT=0
  LEFT=0
fi

if (( $WH > 1440 )); then
  TOP=0
  BOTTOM=0
fi

wrs $(expr $RIGHT + $LEFT) $(expr $TOP + $BOTTOM) $CUR


if (( $TOP > 0 )) || (( $LEFT > 0 )); then
  wmv -$LEFT -$TOP $CUR
fi


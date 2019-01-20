#!/bin/bash

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec ~/.config/sway/start.sh
fi



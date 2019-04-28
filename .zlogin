#!/bin/bash

# start sway on login on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec ~/.config/sway/start.sh
fi



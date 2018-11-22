#!/bin/bash

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  # keyboard settings here for now, can be moved to sway config with 1.0 
  export WLC_REPEAT_RATE=50
  export WLC_REPEAT_DELAY=300
  export XKB_DEFAULT_LAYOUT=us,de
  export XKB_DEFAULT_OPTIONS="grp:win_space_toggle,caps:escape"

  exec sway
fi


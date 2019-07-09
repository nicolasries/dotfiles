#!/bin/bash

if [[ -z $DISPLAY ]]; then
    if [[ $(tty) = /dev/tty1 ]]; then
        startx
    fi
    if [[ $(tty) = /dev/tty2 ]]; then
        exec ~/.config/sway/start.sh
    fi
fi

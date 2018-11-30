#!/bin/bash

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # enable Wayland on some tool kits
    QT_QPA_PLATFORM=wayland-egl
    QT_WAYLAND_DISABLE_WINDOWDECORATION=1

    exec sway
fi


#!/bin/bash

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # enable Wayland on some tool kits
    export QT_QPA_PLATFORM=wayland-egl
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

    exec sway
fi


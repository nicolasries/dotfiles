#!/bin/bash

userresources=$HOME/.Xresources
[ -f "$userresources" ] && xrdb -merge "$userresources"

### Keyboard settings ###
# keyboard rate 200 delay, 30hz refresh
xset r rate 300 50
# switch Capslock and Escape
setxkbmap -option caps:escape
# no pc beep
xset -b

xbindkeys

# source local X startup config
[ -f ~/.xinitrc.local ] && source ~/.xinitrc.local
~/.config/i3/merge-config.sh
~/.config/mopidy/merge-config.sh

# i3
exec i3


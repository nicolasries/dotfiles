#!/bin/sh

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

# i3
exec i3


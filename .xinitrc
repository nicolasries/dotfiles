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

# source local X startup config
[ -f ~/.xinitrc.local ] && source ~/.xinitrc.local

# start compton composite manager
compton --backend glx --paint-on-overlay --vsync opengl-swc &
sleep 2s &

# i3
exec i3


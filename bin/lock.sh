#!/bin/bash

file="/tmp/screen.png"

# i3
maim $file

# sway
# grim $file



convert $file -scale 10% -scale 1000% $file
[[ -f $1 ]] && convert $file $1 -gravity center -composite -matte $file

# i3
i3lock -i $file

# Sway
# swaylock -i $file

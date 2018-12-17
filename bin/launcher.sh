#!/bin/bash

termite --name=launcher -e "bash -c 'find /usr/share/applications -name *.desktop | xargs basename -s .desktop -a | fzf | xargs -r swaymsg -t command exec gtk-launch'"

#!/bin/bash
if [ -f ~/.config/i3/config.local ]
    then
        cat ~/.config/i3/config.base ~/.config/i3/config.local > ~/.config/i3/config
    else
        cat ~/.config/i3/config.base > ~/.config/i3/config
fi

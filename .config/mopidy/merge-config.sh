#!/bin/bash
if [ -f ~/.config/mopidy/spotify.conf ] 
    then
        cat ~/.config/mopidy/mopidy.conf.base ~/.config/mopidy/spotify.conf > ~/.config/mopidy/mopidy.conf
    else
        cat ~/.config/mopidy/mopidy.conf.base > ~/.config/mopidy/mopidy.conf
fi

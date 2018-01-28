#!/bin/bash

updates_arch=$(checkupdates | wc -l)

if hash trizen 2>/dev/null; then
    if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
        updates_aur=0
    fi
else
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))
echo $updates


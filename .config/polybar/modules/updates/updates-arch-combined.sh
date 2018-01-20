#!/bin/sh

updates_arch=$(checkupdates | wc -l)

# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

remote_host="merkur"
updates_remote=$(ssh $remote_host checkupdates | wc -l)

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo " $updates | $remote_host: $updates_remote"
else
    echo ""
fi

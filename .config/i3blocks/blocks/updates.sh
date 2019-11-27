#!/bin/sh

refresh() {
    pkill -RTMIN+6 i3blocks
}

print_updates() {
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

# if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# awk to filter empty 1. line, bug in trizen?
if ! updates_aur=$(trizen -Su --aur --quiet | awk NF | wc -l); then
    # if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))
echo "{\"full_text\": \"$updates\"}"
}
case "$1" in
    --refresh)
        refresh
        ;;
    *)
        print_updates
        ;;
esac


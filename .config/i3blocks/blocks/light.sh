#!/bin/bash

refresh() {
    pkill -RTMIN+5 i3blocks
}

print_light() {
    light=$(light)
    # non-controllable backlight are ignored
    if [ "$light" == "0.00" ]; then
        light=""
    fi
    echo "{\"full_text\" : \"$light\"}"
}

case "$1" in
    --up)
        light -A 10
        refresh
        ;;
    --down)
        light -U 10
        refresh
        ;;
    *)
        print_light
        ;;
esac

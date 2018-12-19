#!/bin/bash

refresh() {
    pkill -RTMIN+5 i3blocks
}

print_light() {
    light
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


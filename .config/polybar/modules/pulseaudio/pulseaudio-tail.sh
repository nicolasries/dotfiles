#!/bin/sh

sink=$(pacmd list-sinks | grep "* index:" | grep -Eo "[0-9]") 
icon_muted=""
icon_low=""
icon_high=""

volume_up() {
    pactl set-sink-volume "$sink" +5%
}

volume_down() {
    pactl set-sink-volume "$sink" -5%
}

volume_mute() {
    pactl set-sink-mute "$sink" toggle
}

volume_print() {
    muted=$(pamixer --sink "$sink" --get-mute)

    if [ "$muted" = true ]; then
        echo "$icon_muted --"
    else
        volume=$(pamixer --sink "$sink" --get-volume)

        if [ "$volume" -lt 50 ]; then
            echo "$icon_low $volume %"
        else
            echo "$icon_high $volume %"
        fi
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac


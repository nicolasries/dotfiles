#!/bin/bash
notification_duration=200
function volume_notify() {
    notify-send -t $notification_duration -u low -i /usr/share/icons/breeze-dark/actions/24/player-volume.svg "$(amixer get Master|tail -n1|sed -E 's/.*\[([0-9]+)\%\].*/\1/')"
}

function toggle_notify() {
    notify-send -t $notification_duration -u low -i /usr/share/icons/breeze-dark/actions/24/player-volume-muted.svg " "
}

sink=$(pactl list sinks short | grep RUNNING | grep -Eo "[0-9]" | head -n 1 )

case $1 in
    "up")
        pactl set-sink-volume $sink +5%
        volume_notify
        ;;
    "down")
        pactl set-sink-volume $sink -5%
        volume_notify
        ;;
    "toggle")
        pactl set-sink-mute $sink toggle
        toggle_notify
        ;;
esac

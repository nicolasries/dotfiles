#!/bin/bash
notification_duration=200
notification_urgency="low"
summary="Volume"
function volume_notify() {
    volume="$(amixer get Master|tail -n1|sed -E 's/.*\[([0-9]+)\%\].*/\1/')"
    icon="/usr/share/icons/breeze-dark/actions/24/player-volume.svg"
    notify-send -h "int:value:$volume" -t $notification_duration -u $notification_urgency -i $icon $summary
}

function toggle_notify() {
    text="muted"
    icon="/usr/share/icons/breeze-dark/actions/24/player-volume-muted.svg"
    notify-send -t $notification_duration -u $notification_urgency -i $icon $summary $text
}


sink=$(pacmd list-sinks | grep "* index:" | grep -Eo "[0-9]")

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

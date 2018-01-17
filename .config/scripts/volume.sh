#!/bin/bash

sink=$(pacmd list-sinks | grep "* index:" | grep -Eo "[0-9]")

case $1 in
    "up")
        pactl set-sink-volume $sink +5%
        ;;
    "down")
        pactl set-sink-volume $sink -5%
        ;;
    "toggle")
        pactl set-sink-mute $sink toggle
        ;;
esac

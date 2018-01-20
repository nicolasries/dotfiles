#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
xrandr --query | grep " connected" | while read -r line ; do
    echo $MONITOR
    if echo $line | grep -q "primary"; then
        bar="primary"
    else
        bar="secondary"
    fi
    MONITOR=$(echo $line | cut -d" " -f1) polybar --reload $bar &
done
echo "Bars launched..."



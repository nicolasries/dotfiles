#!/bin/sh

UNIT="$1"

listen() {

    journalctl --user --follow -o cat --unit $UNIT | while read -r; do
    if [ "$(systemctl --user is-active "$UNIT")" = "active" ]; then
        echo "#1"
    else
        echo "#2"
    fi
done

}

toggle() {
    if [ "$(systemctl --user is-active "$UNIT")" = "active" ]; then
        systemctl --user stop $UNIT
    else
        systemctl --user start $UNIT
    fi
}



case "$2" in
    --toggle)
        toggle
        ;;
    *)
        listen
        ;;
esac

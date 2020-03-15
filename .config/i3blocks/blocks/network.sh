#!/bin/sh

network_print() {
    connection_list=$(nmcli -t -f name,type,device,state connection show --order name --active 2>/dev/null | grep -v ':bridge:')

    if [ -n "$connection_list" ] && [ "$(echo "$connection_list" | wc -l)" -gt 0  ]; then
        echo "$connection_list" | while read -r line; do
            description=$(echo "$line" | cut -d ':' -f 1)
            type=$(echo "$line" | cut -d ':' -f 2)
            device=$(echo "$line" | cut -d ':' -f 3)
            state=$(echo "$line" | cut -d ':' -f 4)

            if [ "$state" = "activated" ]; then
                if [ "$type" = "802-11-wireless" ]; then
                    icon=""

                    signal=$(nmcli -t -f in-use,signal device wifi list ifname "$device" | grep "\*" | cut -d ':' -f 2)
                    if [ "$signal" -lt 40 ]; then
                        description="$description - %{F#f9cc18}$signal%%{F-}"
                    fi
                elif [ "$type" = "802-3-ethernet" ]; then
                    icon=""
                fi
            fi

            echo "{\"full_text\": \"${icon} ${description}\", \"short_text\": \"${icon}\"}"
        done
    else
        icon=""
        echo "{\"full_text\": \"${icon} ${description}\", \"short_text\": \"${icon}\"}"
    fi
}

network_update() {
    pid=$(cat "$path_pid")

    if [ "$pid" != "" ]; then
        kill -10 "$pid"
    fi
}

path_pid="/tmp/polybar-network-networkmanager.pid"

case "$1" in
    --update)
        network_update
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            network_print

            sleep 60 &
            wait
        done
        ;;
esac

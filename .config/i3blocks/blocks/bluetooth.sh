#!/bin/sh
icon=""
icon_connected=""
icon_off=""
bluetooth_print() {
    bluetoothctl | while read -r; do
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            description=""

            devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
            counter=0

            echo "$devices_paired" | while read -r line; do
                device_info=$(bluetoothctl info "$line")

                if echo "$device_info" | grep -q "Connected: yes"; then
                    device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                    if [ $counter -gt 0 ]; then
                        description+=", ${device_alias}"
                    else
                        description+="${device_alias}"
                    fi

                    counter=$((counter + 1))
                fi

                echo "$icon_connected $description"
            done
        else
            echo "$icon_off"
        fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac


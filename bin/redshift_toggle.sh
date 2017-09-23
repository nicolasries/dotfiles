#! /usr/bin/env bash

if $(systemctl -q --user is-active redshift.service)
then
    systemctl -q --user stop redshift.service 
    notify-send --app-name="redshift-toggle.sh" --expire-time=2500 "Turned off Redshift" 
else
    systemctl -q --user start redshift.service 
    notify-send --app-name="redshift-toggle.sh" --expire-time=2500 "Turned on Redshift"
fi


#!/bin/sh
icon=""
full="$(date '+%d/%m/%Y %H:%M')" 
short="$(date '+%H:%M')"
printf '{"full_text": "%s %s", "short_text": "%s"}\n' "$icon" "$full" "$short"

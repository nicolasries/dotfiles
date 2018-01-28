#!/bin/sh
updates=$(~/bin/checkSystemUpdates.sh)
if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo ""
fi

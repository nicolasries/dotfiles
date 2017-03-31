#!/bin/bash
if [ "$1" == "core" ]
then
    pacman -S - < core.txt
elif [ "$1" == "full" ]
then
    pacman -S - < core.txt
    pacman -S - < full.txt
else
    echo "specify \"core\" or \"full\""
fi


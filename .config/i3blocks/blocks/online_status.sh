#!/bin/bash
if ping -c 1 $1 &> /dev/null
then
    echo "$1 UP"
else
    echo "$1 DOWN"
fi

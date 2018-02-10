#!/bin/bash
if hash trizen 2>/dev/null; then
    manager="trizen"
else
    manager="sudo pacman"
fi
$manager -Syu

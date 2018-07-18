#!/bin/bash

url="https://genius.com/search?q="
artist="$(playerctl --player spotify metadata artist)"
title="$(playerctl  --player spotify metadata title)"

$BROWSER "$url$artist $title"

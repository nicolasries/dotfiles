#!/bin/python
import gi
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl

import json
import os
import html
from os.path import expanduser

swayWorkspace = "2:"
# TODO save direct lyrics link
#lyricsFile = expanduser("~") + "/bin/lyrics.json"
player = Playerctl.Player.new('spotify')

id = player.props.metadata['mpris:trackid']

#file = open(lyricsFile, "r")
#x = file.read()
#lyrics = json.loads(x)

# file.write(json)
# file.close()
#link = lyrics.get(id)
link = None

if link:
    os.system("$BROWSER {}".format(link))
else:
    artist_title = "{} {}".format(player.get_artist(),player.get_title())
    os.system("swaymsg workspace " + swayWorkspace) # TODO get workspace dynamically
    htmlLink = html.escape("https://genius.com/search?q={}".format(artist_title.replace(" ", "%20")))
    os.system("$BROWSER " + htmlLink)

file.close()

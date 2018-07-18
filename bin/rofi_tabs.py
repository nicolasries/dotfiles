#!/usr/bin/env python3
import dbus
import argparse
import re

parser = argparse.ArgumentParser()
parser.add_argument('tab', nargs='?')
args = parser.parse_args()


bus = dbus.SessionBus()


# TODO no fixed number, get dynamically
proxy = bus.get_object('org.mpris.MediaPlayer2.plasma-browser-integration',
                       '/TabsRunner')
if args.tab:
    matchObj = re.match( r'.*\[(\d*).*\]', args.tab, re.M|re.I)
    tab_id = matchObj.group(1)
    proxy.Activate(int(tab_id))

else:
    for tab in proxy.GetTabs():
        print(tab['title'] + ' ' + tab['url'] + ' [' +str(int(tab['id'])) + ']')


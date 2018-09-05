#!/usr/bin/env python3

import time
import sys
import subprocess
import argparse

import gi
gi.require_version('Playerctl', '1.0')
from gi.repository import Playerctl, GLib

MUSIC_ICON = ''
PAUSE_ICON = ''
PLAYER_CLOSED_ICON = '#3'
PLAYER_STATUS_PAUSED = 'Paused'
PLAYER_STATUS_PLAYING = 'Playing'


def listPlayers():
    playernames = [
        playername.split('"')[1].split('.')[-1]
        for playername
        in subprocess.getoutput(
            'dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.mpris.MediaPlayer2'
        ).split("\n")
    ]
    players = []
    for name in playernames:
        players.append(Playerctl.Player.new(name))

    return players

def is_active(player):
    # print(player.get_property('status'))
    return player.get_property('status') == PLAYER_STATUS_PLAYING


class PlayerStatus:
    def __init__(self, player):
        self._player = player
        self._players = []
        self._icon = PAUSE_ICON

        self._artist = ''
        self._title = ''
        self._bar = ''

        self._last_status = ''

        player.on('metadata', self._on_metadata)
        player.on('play', self._on_play)
        player.on('pause', self._on_pause)
        player.on('exit', self._on_exit)
        status = player.get_property('status')
        if self._icon == PAUSE_ICON:
            if status == PLAYER_STATUS_PLAYING:
                self._icon = MUSIC_ICON
                self._on_metadata(player, player.get_property('metadata'))
            elif status == PLAYER_STATUS_PAUSED:
                self._icon = PAUSE_ICON

    def show(self):
        self._print_song()


    def _progress_bar(self, current, length):
        bar_length = 20
        filled = round(bar_length * (current / length))
        bar = '=' * filled + '-' * (bar_length - filled)
        return bar

    def _on_metadata(self, player, e):
        # use whitelist for browser stuff
        # if player.props.player_name == 'plasma-browser-integration':
        #     whitelist = ['https://netflix.com', 'https://youtube.com']
        #     source = e['xesam:album']
        #     if source not in whitelist:
        #         print('not in')
        #     else:
        #         print('test')

        position = player.get_property('position')
        length = e['mpris:length']
        if position != 0:
            self._bar = self._progress_bar(position, length)

        if 'xesam:artist' in e.keys():
            self._artist = e['xesam:artist'][0]
        else:
            self._artist = ''
        if 'xesam:title' in e.keys():
            self._title = e['xesam:title']
        else:
            self._title = ''
        self._print_song()

    def _on_play(self, player):
        self._icon = MUSIC_ICON
        # check if something else is playing and pause it
        # TODO: buggy
        # for p in self._players:
        #     if p != player and p.get_property('status') == PLAYER_STATUS_PLAYING:
        #         p.pause()

        self._print_song()

    def _on_pause(self, player):
        self._icon = PAUSE_ICON
        self._print_song()

    def _on_exit(self, player):
        # self._init_players()
        print('exit')

    def _print_song(self):
        # TODO improve formatting
        self._print_flush(
                '[{}] {}  {} - {}'.format(self._bar, self._icon, self._artist, self._title))

    def _print_flush(self, status, **kwargs):
        if len(status) > 50:
            status = status[0:50] + '...'
        if status != self._last_status:
            print(status, **kwargs)
            self._last_status = status

parser = argparse.ArgumentParser()
parser.add_argument('action', choices = ['status', 'play-pause', 'next', 'previous'])
args = parser.parse_args()

statuses = []
players = listPlayers()

if args.action == 'status':

    for player in players:
        statuses.append(PlayerStatus(player))
    for status in statuses:
        status.show()
    # Wait for events
    main = GLib.MainLoop()
    main.run()
else:
    for player in players:
        if is_active(player):
            p = player
        else:
            p = players[0]

    if args.action == 'play-pause':
        p.play_pause()
    if args.action == 'next':
        p.next()
    elif args.action == 'previous':
        p.previous()

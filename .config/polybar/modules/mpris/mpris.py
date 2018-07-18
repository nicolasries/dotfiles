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
    return [
        playername.split('"')[1].split('.')[-1]
        for playername
        in subprocess.getoutput(
            'dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.mpris.MediaPlayer2'
        ).split("\n")
    ]

class PlayerStatus:
    def __init__(self):
        self._players = []
        self._active_player = None
        self._player_class = None
        self._icon = PAUSE_ICON

        self._artist = ''
        self._title = ''
        self._bar = ''

        self._last_status = ''

    def show(self):
        self._init_players()

        # Wait for events
        main = GLib.MainLoop()
        main.run()
        # TODO: update every 30 secs or so bc of bar

    def _init_players(self):
        self._player_class = Playerctl.Player()
        for playerName in listPlayers():
            player = self._player_class.new(playerName)
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
            self._players.append(player)

    def _progress_bar(self, current, length):
        bar_length = 20
        filled = round(bar_length * (current / length))
        bar = '=' * filled + '-' * (bar_length - filled)
        return bar

    def _on_metadata(self, player, e):
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
        self._init_players()

    def _print_song(self):
        # TODO improve formatting
        self._print_flush(
            '[{}] {}  {} - {}'.format(self._bar, self._icon, self._artist, self._title))

    """
    Seems to assure print() actually prints when no terminal is connected
    """

    def _print_flush(self, status, **kwargs):
        if len(status) > 50:
            status = status[0:50] + '...'
        if status != self._last_status:
            print(status, **kwargs)
            sys.stdout.flush()
            self._last_status = status

# parser = argparse.ArgumentParser()
# parser.parse_args()

PlayerStatus().show()


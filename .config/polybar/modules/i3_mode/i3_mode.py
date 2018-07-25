#!/bin/python
import i3ipc
import sys

def my_func(i3, event):
    """

    :type event: i3ipc.GenericEvent
    :type i3: i3ipc.Connection
    """
    if (event.change == 'default'):
        output('')
    else:
        output(event.change)


def output(stuff):
    print(stuff)

i3 = i3ipc.Connection()
i3.on('mode', my_func)


i3.main()

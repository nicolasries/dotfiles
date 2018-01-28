#!/bin/bash

i3-msg workspace "$(xrdb -query all | grep workspace."$1".name | awk '{print $2}')"

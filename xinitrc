#!/usr/bin/env bash

~/.fehbg

picom &
dunst &
/usr/bin/discord --start-minimized &
lxsession &
/usr/bin/thunderbird &

exec dbus-launch i3

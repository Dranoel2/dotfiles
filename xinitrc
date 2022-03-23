#!/usr/bin/env bash

~/.fehbg

picom &
dunst &
/usr/bin/discord --start-minimized &
lxsession &
/usr/bin/thunderbird &
polybar left &
polybar right &

exec dbus-launch i3

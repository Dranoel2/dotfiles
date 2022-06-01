#!/usr/bin/env bash

set -e

~/.fehbg
xsetroot -cursor_name left_ptr

picom &
dunst &
/usr/bin/discord --start-minimized &
lxsession &
/usr/bin/thunderbird &

exec dbus-launch bspwm

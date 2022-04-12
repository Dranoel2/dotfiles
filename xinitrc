#!/usr/bin/env bash

~/.fehbg
xsetroot -cursor_name left_ptr

picom &
dunst &
/usr/bin/discord --start-minimized &
lxsession &
/usr/bin/thunderbird &
glava -d &

exec dbus-launch bspwm

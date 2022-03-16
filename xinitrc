#!/usr/bin/env bash

picom &
feh --bg-fill ~/.dotfiles/wallpaper/dracula-wallpaper.svg &
dunst &
/usr/bin/discord --start-minimized &
lxsession &
/usr/bin/thunderbird &
polybar &

exec dbus-launch i3

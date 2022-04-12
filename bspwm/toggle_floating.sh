#!/usr/bin/env bash

if bspc node -f focused.floating
then
bspc node -t tiled
else
bspc node -t floating
fi

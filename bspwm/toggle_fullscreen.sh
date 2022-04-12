#!/usr/bin/env bash

if bspc node -f focused.fullscreen
then
bspc node -t tiled
else
bspc node -t fullscreen
fi

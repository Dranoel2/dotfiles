#!/usr/bin/env bash

if pgrep picom
then
	killall picom
else
	picom -b
fi

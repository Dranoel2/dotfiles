#!/usr/bin/python
import os
import sys

tiling = {
    "left": "west",
    "down": "south",
    "up": "north",
    "right": "east"
}
floating = {
    "left": "-20 0",
    "down": "0 20",
    "up": "0 -20",
    "right": "20 0"
}

direction = sys.argv[1]
if os.system("bspc node -f focused.floating") == 0:
    os.system(f"bspc node -v {floating[direction]}")
else:
    os.system(f"bspc node -s {tiling[direction]}")

#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="5x4"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
xset dpms 3 # Set 3 seconds until monitor off
i3lock -i $PICTURE --nofork;
rm $PICTURE
xset dpms 300 # Set 5 minutes until monitor off

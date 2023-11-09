#!/bin/bash

ICON=$1

if [ -z $1 ]; then
    exit 1;
fi

convert \
    "favicon-$ICON.svg" \
    -type Grayscale \
    -negate \
    -fill white \
    -fuzz 11% \
    +opaque \
    "#000000" \
    -blur 0x1 \
    tmp-mask.jpg

convert \
    favicon-$ICON.svg \
    tmp-mask.jpg \
    -compose copy_opacity \
    -composite favicon-$ICON.ico


rm tmp-mask.jpg

echo "favicon-$ICON.ico"

#!/bin/bash

IMAGE=/tmp/i3lock.png

BLURTYPE="0x5"

scrot $IMAGE
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE

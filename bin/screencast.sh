#!/bin/bash
TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
OUTPUT="$HOME/Pictures/Screencasts/$(date +%F-%H-%M-%S)"

# make sure the directory ~/Pictures/Screencasts already exists, or it wont work

read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
# 1.0 is the display number, might have to change it
ffmpeg -f x11grab -s "$W"x"$H" -i :1.0+$X,$Y "$TMPFILE"


notify-send 'generating palette'
ffmpeg -y -i "$TMPFILE"  -vf fps=10,palettegen /tmp/palette.png
notify-send 'generating gif'

ffmpeg -i "$TMPFILE" -i /tmp/palette.png -filter_complex "paletteuse" $OUTPUT.gif
mv $TMPFILE $OUTPUT.mkv

notify-send "size $(du -h $OUTPUT.gif | awk '{print $1}')"

eog $OUTPUT.gif

trap "rm -f '$TMPFILE'" 0

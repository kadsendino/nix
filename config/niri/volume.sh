#!/bin/bash

# Replace with your keyboard consumer control device
DEVICE="/dev/input/event5"

echo "Listening for volume keys on $DEVICE..."

# Run evtest in read-only mode and parse key presses
sudo evtest --grab "$DEVICE" 2>/dev/null | while read -r line; do
  if echo "$line" | grep -q "KEY_VOLUMEUP.*value 1"; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    echo "Volume Up"
  elif echo "$line" | grep -q "KEY_VOLUMEDOWN.*value 1"; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    echo "Volume Down"
  elif echo "$line" | grep -q "KEY_MUTE.*value 1"; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    echo "Mute toggled"
  fi
done

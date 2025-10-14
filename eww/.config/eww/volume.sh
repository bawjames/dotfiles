#!/bin/bash

volume() {
      if [[ $(pactl get-sink-mute @DEFAULT_SINK@) == "Mute: yes" ]]; then
        echo "Mu"
      else
        pactl get-sink-volume @DEFAULT_SINK@ | \
          grep -oP '\d+(?=%)' | \
          head -n1
      fi
}

volume

pactl subscribe | grep --line-buffered "on sink" | \
  while read -r line; do
    volume
  done

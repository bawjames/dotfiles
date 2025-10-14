#!/bin/bash

echo $(hyprctl -j activeworkspace | jq ".id")

handle() {
  case $1 in
    'workspace>>'*)
      echo "${1#workspace>>}"
    ;;
  esac
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | \
  while read -r line; do handle "$line"; done

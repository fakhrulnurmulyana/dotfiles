#!/usr/bin/env bash

DEVICE="asue1201:00-04f3:3125-touchpad"
STATE_FILE="/tmp/hypr-touchpad-disabled"

if [[ -f "$STATE_FILE" ]]; then
    hyprctl keyword "device[$DEVICE]:enabled" true
    rm "$STATE_FILE"
else
    hyprctl keyword "device[$DEVICE]:enabled" false
    touch "$STATE_FILE"
fi

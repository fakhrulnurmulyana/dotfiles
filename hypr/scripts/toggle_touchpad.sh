#!/usr/bin/env bash

DEVICE="asue1201:00-04f3:3125-touchpad"
STATE_FILE= ~/dotfiles/hypr/hypr-touchpad-disabled

if [[ -f "$STATE_FILE" ]]; then
    # Enable touchpad
    hyprctl eval "hl.device({ name = \"$DEVICE\", enabled = true })"
    rm -f "$STATE_FILE"
else
    # Disable touchpad
    hyprctl eval "hl.device({ name = \"$DEVICE\", enabled = false })"
    touch "$STATE_FILE"
fi

#!/bin/bash

iface=$(ip route | awk '/default/ {print $5; exit}')

rx_prev=$(cat /tmp/waybar_net_rx_prev 2>/dev/null || echo 0)
tx_prev=$(cat /tmp/waybar_net_tx_prev 2>/dev/null || echo 0)

rx_curr=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx_curr=$(cat /sys/class/net/$iface/statistics/tx_bytes)

echo "$rx_curr" >/tmp/waybar_net_rx_prev
echo "$tx_curr" >/tmp/waybar_net_tx_prev

if [ "$rx_prev" -eq 0 ] || [ "$tx_prev" -eq 0 ]; then
    echo "󰇚 -- 󰕒 --"
    exit
fi

rx_speed=$((rx_curr - rx_prev))
tx_speed=$((tx_curr - tx_prev))

format_speed() {
    local speed=$1

    if [ "$speed" -ge 1048576 ]; then
        awk "BEGIN {printf \"%.1f MB/s\", $speed/1048576}"
    elif [ "$speed" -ge 1024 ]; then
        awk "BEGIN {printf \"%.1f KB/s\", $speed/1024}"
    else
        printf "%d B/s" "$speed"
    fi
}

echo "󰇚 $(format_speed "$rx_speed") 󰕒 $(format_speed "$tx_speed")"

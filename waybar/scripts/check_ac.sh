#!/bin/bash 
ac_status=$(cat /sys/class/power_supply/AC*/online 2>/dev/null | head -n 1) 
capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -n 1) 
status_text=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | head -n 1) 
if [ "$ac_status" = "1" ]; then 
	plug_status="Plugged In" 
else 
	plug_status="Unplugged" 
fi 

if [ "$capacity" -lt 10 ]; then 
	class="critical" 
else 
	class="normal" 
fi 

echo "{\"text\": \"$capacity\", \"class\":\"$class\", \"tooltip\": \"Power Supply: $plug_status\nBattery Status: $status_text\nCapacity: $capacity%\"}"

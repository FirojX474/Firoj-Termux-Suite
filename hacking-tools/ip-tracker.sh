#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- IP Geolocation Tracker ---${RESET}"
echo "Enter IP Address (Leave empty for your own):"
read ip

echo -e "${YELLOW}[*] Fetching data...${RESET}"
if [ -z "$ip" ]; then
    curl -s "ipinfo.io/json" | jq .
else
    curl -s "ipinfo.io/$ip/json" | jq .
fi
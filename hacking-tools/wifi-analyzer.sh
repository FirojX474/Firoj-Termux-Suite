#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Network Device Analyzer (ARP) ---${RESET}"
echo "Scanning local network for devices..."

# ARP Scan
echo -e "${YELLOW}Connected Devices (ARP Table):${RESET}"
arp -a

echo "---------------------------------"
echo -e "${YELLOW}Interface Config:${RESET}"
ifconfig | grep -E "wlan0|inet"
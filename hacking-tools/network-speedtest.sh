#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Network Speedtest ---${RESET}"

if command -v speedtest-go &> /dev/null; then
    speedtest-go
elif command -v python &> /dev/null; then
    echo "Using Python speedtest..."
    pip install speedtest-cli &> /dev/null
    speedtest-cli --simple
else
    echo -e "${RED}[!] No speedtest tool found. Installing speedtest-go...${RESET}"
    pkg install speedtest-go -y
    speedtest-go
fi
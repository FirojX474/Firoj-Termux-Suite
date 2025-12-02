#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Nmap Port Scanner ---${RESET}"
echo "Enter Target IP/Domain:"
read target

echo "Select Scan Type:"
echo "1. Fast Scan (Top 100 ports)"
echo "2. Full Scan (All ports - Slow)"
echo "3. OS Detection (Requires Root)"
read mode

case $mode in
    1) nmap -F "$target" ;;
    2) nmap -p- "$target" ;;
    3) nmap -O "$target" ;;
    *) echo "Invalid option" ;;
esac
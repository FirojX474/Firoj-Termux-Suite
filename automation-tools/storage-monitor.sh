#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Storage Monitor ---${RESET}"
echo -e "${YELLOW}[1] System Storage Usage:${RESET}"
df -h | grep -E 'Filesystem|/data|/sdcard'

echo -e "\n${YELLOW}[2] Large Files (>50MB) in Termux:${RESET}"
find "$HOME" -type f -size +50M -exec ls -lh {} \; | awk '{print $9 ": " $5}' 2>/dev/null

if [ -z "$(find "$HOME" -type f -size +50M 2>/dev/null)" ]; then
    echo "No large files found."
fi
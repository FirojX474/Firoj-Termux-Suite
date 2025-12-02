#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

if ! command -v jp2a &> /dev/null; then
    echo "Installing jp2a..."
    pkg install jp2a -y
fi

echo -e "${CYAN}--- Image to ASCII Art ---${RESET}"
echo "Enter image path (jpg/png):"
read -e img

if [ -f "$img" ]; then
    # --colors preserves basic coloring
    jp2a --colors "$img"
else
    echo -e "${RED}[!] File not found.${RESET}"
fi
#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- QR Code Generator ---${RESET}"
echo "Enter text or URL:"
read input

echo -e "${GREEN}Generating QR Code...${RESET}"
# -t ANSIUTF8 makes it viewable in terminal
qrencode -t ANSIUTF8 "$input"

echo -e "\n${YELLOW}Do you want to save as PNG? (y/n)${RESET}"
read save
if [[ "$save" == "y" ]]; then
    qrencode -o "qr_code.png" "$input"
    echo "Saved as qr_code.png"
fi
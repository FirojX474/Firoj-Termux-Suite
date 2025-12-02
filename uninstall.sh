#!/bin/bash
# Uninstaller
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/core/colors.sh"

echo -e "${RED}[!] Are you sure you want to uninstall Firoj-Termux-Suite? (y/n)${RESET}"
read choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo -e "${YELLOW}[*] Removing global command...${RESET}"
    rm "$PREFIX/bin/firoj"
    
    echo -e "${YELLOW}[*] Removing directory...${RESET}"
    rm -rf "$DIR"
    
    echo -e "${GREEN}[✔] Uninstalled Successfully.${RESET}"
else
    echo -e "${BLUE}[*] Uninstall cancelled.${RESET}"
fi
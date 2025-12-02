#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${RED}[!] Warning: This will clear cache and unused packages.${RESET}"
echo "Press Enter to continue..."
read

echo -e "${YELLOW}[*] Cleaning Apt Cache...${RESET}"
apt clean
apt autoremove -y

echo -e "${YELLOW}[*] Cleaning Temp Files...${RESET}"
rm -rf "$PREFIX/tmp/*"
rm -rf "$HOME/.cache/*"

echo -e "${GREEN}[✔] System Cleanup Finished.${RESET}"
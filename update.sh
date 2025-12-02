#!/bin/bash
# Update Script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/core/colors.sh"

echo -e "${BLUE}[*] Checking for updates...${RESET}"
cd "$DIR"
git pull origin main

echo -e "${BLUE}[*] Re-installing permissions...${RESET}"
bash install.sh

echo -e "${GREEN}[✔] Update Complete! Restart the tool.${RESET}"
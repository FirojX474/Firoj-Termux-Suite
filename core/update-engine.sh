#!/bin/bash
source "$(dirname "$0")/colors.sh"

echo -e "${BLUE}[*] Checking for updates...${RESET}"
git fetch origin

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL = $REMOTE ]; then
    echo -e "${GREEN}[✔] System is up to date.${RESET}"
else
    echo -e "${YELLOW}[!] New update found! Updating...${RESET}"
    git pull origin main
    chmod +x ../install.sh
    bash ../install.sh
    echo -e "${GREEN}[✔] Update Complete. Restart the tool.${RESET}"
fi
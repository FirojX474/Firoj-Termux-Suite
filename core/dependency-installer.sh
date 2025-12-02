#!/bin/bash
source "$(dirname "$0")/colors.sh"
echo -e "${BLUE}[*] Checking Dependencies...${RESET}"

pkgs=(ffmpeg imagemagick tesseract nmap python jq bc zip unzip curl speedtest-go jp2a qrencode figlet whois)

for pkg in "${pkgs[@]}"; do
    if ! command -v $pkg &> /dev/null; then
        echo -e "${YELLOW}[!] Installing $pkg...${RESET}"
        pkg install $pkg -y > /dev/null 2>&1
    fi
done
echo -e "${GREEN}[✔] Dependencies Ready.${RESET}"
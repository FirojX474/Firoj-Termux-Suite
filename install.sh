#!/bin/bash
# Installer for Firoj-Termux-Suite
# Developed by: Firoj Mondal

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/core/colors.sh"

echo -e "${CYAN}---------------------------------------${RESET}"
echo -e "${YELLOW}   INSTALLING FIROJ-TERMUX-SUITE...  ${RESET}"
echo -e "${CYAN}---------------------------------------${RESET}"

# 1. Permission Setup
echo -e "${BLUE}[*] Setting up permissions...${RESET}"
chmod +x "$DIR/firoj"
chmod +x "$DIR/install.sh"
chmod +x "$DIR/uninstall.sh"
chmod +x "$DIR/update.sh"
chmod +x "$DIR/core/"*.sh
chmod +x "$DIR/ai-tools/"*.sh
chmod +x "$DIR/automation-tools/"*.sh
chmod +x "$DIR/image-video-gen/"*.sh
chmod +x "$DIR/hacking-tools/"*.sh

# 2. Dependency Installation
if [ -f "$DIR/core/dependency-installer.sh" ]; then
    bash "$DIR/core/dependency-installer.sh"
else
    echo -e "${RED}[!] Dependency installer not found!${RESET}"
    echo -e "${YELLOW}[*] Installing basics manually...${RESET}"
    pkg update -y && pkg install python ffmpeg imagemagick tesseract nmap jq bc zip unzip curl jp2a qrencode speedtest-go -y
fi

# 3. Global Command Setup
echo -e "${BLUE}[*] Creating global command 'firoj'...${RESET}"
if [[ -f "$PREFIX/bin/firoj" ]]; then
    rm "$PREFIX/bin/firoj"
fi
ln -s "$DIR/firoj" "$PREFIX/bin/firoj"

echo -e "${GREEN}---------------------------------------${RESET}"
echo -e "${GREEN}[✔] INSTALLATION SUCCESSFUL!${RESET}"
echo -e "${CYAN}---------------------------------------${RESET}"
echo -e "${YELLOW}Type ${BOLD}'firoj'${RESET}${YELLOW} anywhere to start the tool.${RESET}"
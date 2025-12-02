#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Video to MP3 Converter ---${RESET}"
echo "Enter video file path:"
read -e vid

if [[ ! -f "$vid" ]]; then
    echo -e "${RED}[!] File not found.${RESET}"
    exit 1
fi

name=$(basename "$vid")
output="${name%.*}.mp3"

echo -e "${YELLOW}[*] Converting... Please wait.${RESET}"
ffmpeg -i "$vid" -q:a 0 -map a "$output" -y -hide_banner -loglevel warning

echo -e "${GREEN}[✔] Conversion Done: $output${RESET}"
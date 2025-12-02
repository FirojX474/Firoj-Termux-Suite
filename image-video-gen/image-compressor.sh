#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Image Compressor ---${RESET}"
echo "Enter image path:"
read -e img

if [ ! -f "$img" ]; then
    echo -e "${RED}[!] File not found.${RESET}"
    exit 1
fi

echo "Enter Quality (1-100, standard is 60-75):"
read q
q=${q:-70}

name=$(basename "$img")
output="compressed_$name"

convert "$img" -quality "$q" "$output"
echo -e "${GREEN}[✔] Saved as: $output${RESET}"
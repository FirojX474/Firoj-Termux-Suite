#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Image Resizer ---${RESET}"
echo "Enter image path:"
read -e img

if [[ ! -f "$img" ]]; then
    echo -e "${RED}[!] File not found.${RESET}"
    exit 1
fi

echo "Enter resize percentage (e.g., 50%):"
read pct

filename=$(basename "$img")
extension="${filename##*.}"
name="${filename%.*}"
output="${name}_resized.${extension}"

convert "$img" -resize "$pct" "$output"

echo -e "${GREEN}[✔] Saved as: $output${RESET}"
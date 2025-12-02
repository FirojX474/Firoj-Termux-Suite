#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Offline OCR (Image to Text) ---${RESET}"
if ! command -v tesseract &> /dev/null; then
    echo -e "${RED}[!] Tesseract is not installed. Run setup again.${RESET}"
    exit 1
fi

echo "Enter image path (jpg/png):"
read -e imgpath

if [[ -f "$imgpath" ]]; then
    output="ocr_result"
    tesseract "$imgpath" "$output" -l eng
    echo -e "${GREEN}[✔] Text saved to ${output}.txt${RESET}"
    echo -e "${YELLOW}Preview:${RESET}"
    head -n 5 "${output}.txt"
else
    echo -e "${RED}[!] Image not found.${RESET}"
fi
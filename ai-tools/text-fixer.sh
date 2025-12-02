#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- AI Text Fixer (Rule Based) ---${RESET}"
echo "Enter path of the text file to fix:"
read -e filepath

if [[ -f "$filepath" ]]; then
    echo -e "${YELLOW}[*] Processing...${RESET}"
    # 1. Remove extra spaces
    # 2. Capitalize first letter of sentences
    # 3. Fix space after periods
    sed -i 's/  */ /g' "$filepath"
    sed -i 's/ \.$/./g' "$filepath"
    # Note: Complex capitalization in pure sed is hard, using python for logic
    python3 -c "import sys; print(open('$filepath').read().strip().capitalize())" > "${filepath}_fixed.txt"
    
    echo -e "${GREEN}[✔] Fixed text saved to: ${filepath}_fixed.txt${RESET}"
else
    echo -e "${RED}[!] File not found!${RESET}"
fi
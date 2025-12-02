#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- File Summarizer (Logic Based) ---${RESET}"
echo "Enter text file path:"
read -e file

if [[ ! -f "$file" ]]; then
    echo -e "${RED}[!] File not found.${RESET}"
    exit 1
fi

echo -e "${YELLOW}[*] Generating Summary (Key Sentences)...${RESET}"
echo "------------------------------------------------"

# Logic: Prints the first sentence of every paragraph and lines containing "important/conclusion"
awk '
BEGIN {RS=""; FS="\n"} 
{
    # Print first sentence of paragraph
    split($1, a, "."); 
    if (length(a[1]) > 10) print "• " a[1] "."
}
' "$file"

echo "------------------------------------------------"
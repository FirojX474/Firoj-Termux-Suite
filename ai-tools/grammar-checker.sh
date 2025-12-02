#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Basic Grammar Checker ---${RESET}"
echo "Enter text or file path:"
read input

if [[ -f "$input" ]]; then
    text=$(cat "$input")
else
    text="$input"
fi

echo -e "${BLUE}[*] Analyzing...${RESET}"
echo "--------------------------------"

# Check 1: Repeated words (e.g., "the the")
echo "$text" | grep -oE '(\b\w+\b)[[:space:]]+\1' > /dev/null
if [ $? -eq 0 ]; then
    echo -e "${RED}[!] Issue: Repeated words found:${RESET}"
    echo "$text" | grep -oE '(\b\w+\b)[[:space:]]+\1'
else
    echo -e "${GREEN}[✔] No repeated words found.${RESET}"
fi

# Check 2: Passive Voice indicator (simple check)
if [[ "$text" =~ "was done" || "$text" =~ "been" ]]; then
    echo -e "${YELLOW}[!] Note: Passive voice detected.${RESET}"
fi

echo "--------------------------------"
echo -e "${GREEN}Check Complete.${RESET}"
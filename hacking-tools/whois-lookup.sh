#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Whois Lookup ---${RESET}"
echo "Enter Domain (e.g., google.com):"
read domain

if [ -z "$domain" ]; then
    echo "Invalid domain."
    exit 1
fi

echo -e "${YELLOW}[*] Fetching records...${RESET}"
whois "$domain" | grep -E "Domain Name|Registry|Registrar|Creation Date|Expiry Date" | head -n 20
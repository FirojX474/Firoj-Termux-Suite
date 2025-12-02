#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Secure Password Generator ---${RESET}"
echo "Enter password length (default 16):"
read len
len=${len:-16}

echo -e "${GREEN}Generated Password:${RESET}"
# Uses openssl for high randomness
openssl rand -base64 48 | cut -c1-$len
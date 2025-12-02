#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- Text Encryption/Decryption (AES-256) ---${RESET}"
echo "1. Encrypt Text/File"
echo "2. Decrypt Text/File"
read mode

if [ "$mode" == "1" ]; then
    echo "Enter text or file path to ENCRYPT:"
    read input
    echo "Set a Password:"
    
    if [ -f "$input" ]; then
        openssl enc -aes-256-cbc -salt -pbkdf2 -in "$input" -out "${input}.enc"
        echo -e "${GREEN}[✔] File encrypted: ${input}.enc${RESET}"
    else
        echo "$input" | openssl enc -aes-256-cbc -a -salt -pbkdf2
    fi

elif [ "$mode" == "2" ]; then
    echo "Enter encrypted text (Base64) or .enc file path:"
    read input
    echo "Enter Password:"
    
    if [ -f "$input" ]; then
        outname="${input%.enc}"
        openssl enc -aes-256-cbc -d -salt -pbkdf2 -in "$input" -out "decrypted_$outname"
        echo -e "${GREEN}[✔] File decrypted: decrypted_$outname${RESET}"
    else
        echo "$input" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2
    fi
fi
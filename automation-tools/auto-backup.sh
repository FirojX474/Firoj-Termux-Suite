#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

BACKUP_DIR="/sdcard/FirojBackups"
mkdir -p "$BACKUP_DIR"
DATE=$(date +%Y-%m-%d_%H-%M)
FILENAME="termux_backup_$DATE.tar.gz"

echo -e "${BLUE}[*] Starting Backup...${RESET}"
echo "Target: $HOME"
echo "Destination: $BACKUP_DIR/$FILENAME"

# Exclude cache and backup folder itself to save space
tar -czf "$BACKUP_DIR/$FILENAME" \
    --exclude='.cache' \
    --exclude='FirojBackups' \
    -C "$HOME" .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[✔] Backup Successful!${RESET}"
    ls -lh "$BACKUP_DIR/$FILENAME"
else
    echo -e "${RED}[!] Backup Failed!${RESET}"
fi
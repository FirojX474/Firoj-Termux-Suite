#!/bin/bash
source "$(dirname "$0")/colors.sh"

echo -e "${CYAN}--- System Diagnostics ---${RESET}"

# CPU Info
echo -e "${YELLOW}[CPU Info]${RESET}"
lscpu | grep "Model name" || echo "Architecture: $(uname -m)"

# Memory (RAM)
echo -e "\n${YELLOW}[Memory Usage]${RESET}"
free -h | grep "Mem" | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}'

# Uptime
echo -e "\n${YELLOW}[Uptime]${RESET}"
uptime -p

# Kernel
echo -e "\n${YELLOW}[Kernel]${RESET}"
uname -r
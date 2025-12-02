#!/bin/bash
source "$(dirname "$0")/../core/colors.sh"

echo -e "${CYAN}--- High CPU Process Killer ---${RESET}"
echo "Top 5 CPU Consuming Processes (User):"

# Show processes for current user only
ps -u $(whoami) -o pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n${RED}Enter PID to kill (or 0 to cancel):${RESET}"
read pid

if [ "$pid" != "0" ] && [ ! -z "$pid" ]; then
    kill -9 "$pid"
    echo -e "${GREEN}[✔] Process $pid killed.${RESET}"
else
    echo "Cancelled."
fi
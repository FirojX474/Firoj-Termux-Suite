#!/bin/bash
source "$(dirname "$0")/core/colors.sh"

print_banner() {
    clear
    echo -e "${CYAN}"
    echo "███████╗██╗██╗░░░██╗██████╗░░█████╗░░░░░░░"
    echo "██╔════╝██║╚██╗░██╔╝██╔══██╗██╔══██╗░░░░░░"
    echo "█████╗░░██║░╚████╔╝░██████╦╝██║░░██║█████╗"
    echo "██╔══╝░░██║░░╚██╔╝░░██╔══██╗██║░░██║╚════╝"
    echo "██║░░░░░██║░░░██║░░░██████╦╝╚█████╔╝░░░░░░"
    echo "╚═╝░░░░░╚═╝░░░╚═╝░░░╚═════╝░░╚════╝░░░░░░░"
    echo -e "${RESET}"
    echo -e "${YELLOW} Developed by: ${BOLD}Firoj Mondal${RESET}"
    echo -e "${YELLOW} Project:      ${BOLD}Firoj-Termux-Suite${RESET}"
    echo "==========================================="
}
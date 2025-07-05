#!/bin/bash

set -e

PINK=$(tput setaf 204)
PURPLE=$(tput setaf 141)
GREEN=$(tput setaf 114)
ORANGE=$(tput setaf 208)
BLUE=$(tput setaf 75)
YELLOW=$(tput setaf 221)
RED=$(tput setaf 196)
NC=$(tput sgr0) # No Color

logo='
██    ██  ██████  ██   ██  █████  ██    ██████   ██████  ████████ ███████ 
██    ██ ██    ██  ██ ██  ██   ██ ██    ██   ██ ██    ██    ██    ██      
██    ██ ██    ██   ███   ███████ ██    ██   ██ ██    ██    ██    ███████ 
 ██  ██  ██    ██  ██ ██  ██   ██ ██    ██   ██ ██    ██    ██         ██ 
  ████    ██████  ██   ██ ██   ██ ██ ██ ██████   ██████     ██    ███████
'

# Display logo and title
echo -e "${PINK}${logo}${NC}"
echo -e "${PURPLE}Welcome to the VoxAI.Dots Auto Config!${NC}"

# Function to install ghostty configuration
install_ghostty_config() {
  echo -e "${BLUE}Installing ghostty configuration...${NC}"
  mkdir -p ~/.config/ghostty
  cp .ghostty/config ~/.config/ghostty/config
  echo -e "${GREEN}ghostty configuration installed successfully.${NC}"
}

# Main menu
echo -e "${ORANGE}Please select an option:${NC}"
echo "1) Install essential dependencies (yt-dlp, mpv, playerctl, etc.)"
echo "2) Install SpeechNote via Flatpak"
echo "3) Install ghostty configuration"
echo "4) Exit"

read -rp "Enter your choice [1-4]: " choice

case $choice in
1)
  echo -e "${YELLOW}Installing essential dependencies...${NC}"
  sudo pacman -Syu yt-dlp mpv playerctl git bash flatpak --noconfirm
  echo -e "${GREEN}Dependencies installed successfully.${NC}"
  ;;
2)
  echo -e "${YELLOW}Installing SpeechNote via Flatpak...${NC}"
  flatpak install -y flathub net.mkiol.SpeechNote
  echo -e "${GREEN}SpeechNote installed successfully.${NC}"
  ;;
3)
  install_ghostty_config
  ;;
4)
  echo -e "${RED}Exiting...${NC}"
  exit 0
  ;;
*)
  echo -e "${RED}Invalid option. Exiting...${NC}"
  exit 1
  ;;
esac

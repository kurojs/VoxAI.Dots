#!/bin/bash

set -e

# Colors for styling
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

# Check for required tools
command -v pacman >/dev/null 2>&1 || { echo -e "${RED}Error: pacman is not installed. Exiting.${NC}"; exit 1; }
command -v flatpak >/dev/null 2>&1 || { echo -e "${RED}Error: flatpak is not installed. Exiting.${NC}"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo -e "${RED}Error: Python 3 is not installed. Exiting.${NC}"; exit 1; }

# Function to install essential dependencies
install_dependencies() {
  echo -e "${BLUE}Installing essential dependencies...${NC}"
  sudo pacman -Syu yt-dlp mpv playerctl git bash flatpak curl jq --noconfirm
  echo -e "${GREEN}Essential dependencies installed successfully.${NC}"
}

# Function to install SpeechNote via Flatpak
install_speechnote() {
  echo -e "${BLUE}Installing SpeechNote via Flatpak...${NC}"
  flatpak install -y flathub net.mkiol.SpeechNote
  echo -e "${GREEN}SpeechNote installed successfully.${NC}"
}

# Function to install ghostty configuration
install_ghostty_config() {
  if [[ ! -f .config/ghostty/config ]]; then
    echo -e "${RED}Error: ghostty configuration file not found.${NC}"
    exit 1
  fi
  echo -e "${BLUE}Installing ghostty configuration...${NC}"
  mkdir -p ~/.config/ghostty
  cp .config/ghostty/config ~/.config/ghostty/config
  echo -e "${GREEN}ghostty configuration installed successfully.${NC}"
}

# Function to copy scripts to local bin
install_scripts() {
  if [[ ! -d bin ]]; then
    echo -e "${RED}Error: bin directory not found.${NC}"
    exit 1
  fi
  echo -e "${BLUE}Copying scripts to ~/.local/bin...${NC}"
  mkdir -p ~/.local/bin
  cp bin/* ~/.local/bin/
  chmod +x ~/.local/bin/*
  echo -e "${GREEN}Scripts installed successfully.${NC}"
}

# Function to configure Gemini CLI
configure_gemini() {
  if [[ ! -f .gemini/GEMINI.md ]]; then
    echo -e "${RED}Error: Gemini configuration file not found.${NC}"
    exit 1
  fi
  echo -e "${BLUE}Configuring Gemini CLI...${NC}"
  mkdir -p ~/.gemini
  cp .gemini/GEMINI.md ~/.gemini/
  echo -e "${GREEN}Gemini CLI configured successfully.${NC}"
}

# Function to generate Spotify token
generate_spotify_token() {
  if [[ ! -f bin/get_spotify_token.py ]]; then
    echo -e "${RED}Error: Spotify token script not found.${NC}"
    exit 1
  fi
  echo -e "${BLUE}Generating Spotify token...${NC}"
  python3 bin/get_spotify_token.py
  echo -e "${GREEN}Spotify token generated successfully.${NC}"
}

# Main menu
while true; do
  echo -e "${ORANGE}Please select an option:${NC}"
  echo "1) Install essential dependencies (yt-dlp, mpv, playerctl, etc.)"
  echo "2) Install SpeechNote via Flatpak"
  echo "3) Install ghostty configuration"
  echo "4) Copy scripts to ~/.local/bin"
  echo "5) Configure Gemini CLI"
  echo "6) Generate Spotify token"
  echo "7) Install everything (Full Setup)"
  echo "8) Exit"

  read -rp "Enter your choice [1-8]: " choice

  case $choice in
  1)
    install_dependencies
    ;;
  2)
    install_speechnote
    ;;
  3)
    install_ghostty_config
    ;;
  4)
    install_scripts
    ;;
  5)
    configure_gemini
    ;;
  6)
    generate_spotify_token
    ;;
  7)
    echo -e "${YELLOW}Starting full setup...${NC}"
    install_dependencies
    install_speechnote
    install_ghostty_config
    install_scripts
    configure_gemini
    generate_spotify_token
    echo -e "${GREEN}Full setup completed successfully.${NC}"
    ;;
  8)
    echo -e "${RED}Exiting...${NC}"
    exit 0
    ;;
  *)
    echo -e "${RED}Invalid option. Please try again.${NC}"
    ;;
  esac
done

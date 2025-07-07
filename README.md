# VoxAI.Dots

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-6e40c9?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Bash](https://img.shields.io/badge/Bash-6e40c9?logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Python](https://img.shields.io/badge/Python-6e40c9?logo=python&logoColor=white)](https://www.python.org/)
[![Node.js](https://img.shields.io/badge/Node.js-6e40c9?logo=node.js&logoColor=white)](https://nodejs.org/)
[![mpv](https://img.shields.io/badge/MPV-6e40c9?logo=mpv&logoColor=white)](https://mpv.io/)
[![yt-dlp](https://img.shields.io/badge/yt--dlp-6e40c9)](https://github.com/yt-dlp/yt-dlp)
[![playerctl](https://img.shields.io/badge/playerctl-6e40c9)](https://github.com/altdesktop/playerctl)
[![SpeechNote](https://img.shields.io/badge/SpeechNote-6e40c9)](https://github.com/mkiol/SpeechNote)
[![ghostty](https://img.shields.io/badge/ghostty-6e40c9)](https://github.com/ghostty-org/ghostty)
[![License: MIT](https://img.shields.io/badge/License-MIT-6e40c9)](https://opensource.org/licenses/MIT)

> VoxAI.Dots – The Modular Jarvis-Like AI Assistant for Arch Linux

VoxAI.Dots is a modular collection of personal dotfiles enhanced with AI, designed to optimize productivity on Arch Linux systems. Inspired by Jarvis, it integrates seamlessly with Gemini CLI, Spotify, and advanced terminal tools to deliver real-time voice synthesis, intelligent music control, and a floating terminal experience. Lightweight, scalable, and highly customizable, VoxAI.Dots brings together automation, multimedia control, and smart scripting in a unified environment tailored for advanced users.

---

# Preview

<https://github.com/user-attachments/assets/bf2f9693-8dae-465f-bd67-b2f1e275c19c>

---

## 📦 Table of Contents

1. [Features](#features)
2. [Architecture](#architecture)
3. [Requirements](#requirements)
4. [Installation](#installation)
   - [Automated Installation](#automated-installation)
   - [Manual Installation](#manual-installation)
5. [Usage](#usage)
6. [Configuration](#configuration)
   - [Gemini CLI Instructions](#gemini-cli-instructions)
7. [Available Commands](#available-commands)
8. [Troubleshooting](#troubleshooting)
9. [Security](#security)
10. [Contributing](#contributing)
11. [Acknowledgments](#acknowledgments)

---

## 👾 Features

- **Voice-Controlled CLI**: Seamless integration with Gemini CLI for executing predefined instructions.
- **Spotify Integration**: Play tracks, playlists, and liked songs directly from the terminal.
- **Real-Time Voice Synthesis**: Powered by SpeechNote for immersive feedback.
- **Floating Terminal**: Customizable terminal powered by [ghostty](https://github.com/ghostty-org/ghostty).
- **Modular Architecture**: Easily extendable and adaptable to your workflow.
- **Error Handling**: Robust logging and debugging tools.

---

## 🧰 Architecture

```plaintext
VoxAI.Dots/
├── README.md                  # Documentation
├── .gemini/
│   └── GEMINI.md              # Gemini CLI instructions
├── bin/
│   ├── speech_wrapper.sh      # Voice synthesis wrapper
│   ├── play                   # Music playback script
│   ├── my_playlist.sh         # Spotify playlist playback
│   ├── my_spotify.sh          # Spotify playback controller
│   └── get_spotify_token.py   # Spotify OAuth token generator
├── .config/
│   └── ghostty/
│       └── config             # Floating terminal configuration
├── Docs/
│   └── SPOTIFY.md             # Spotify integration documentation
├── install.sh                 # Automated installation script
└── .gitignore                 # Git ignore files
```

---

## 🛠 Requirements

### System Dependencies

- **Core Tools**: `bash`, `git`, `curl`, `jq`
- **Media Tools**: `yt-dlp`, `mpv`, `playerctl`
- **Flatpak**: For managing SpeechNote
- **Python 3.7+**: Required for Spotify token generation
- **Node.js 20+**: Required for Gemini CLI

---

## 🍫 Installation

### Automated Installation

Run the following command to set up everything automatically:

1. Clone the repository:

   ```bash
   git clone https://github.com/kurojs/VoxAI.Dots.git
   cd VoxAI.Dots
   ```

2. Run the installation script:

   ```bash
   bash install.sh
   ```

### Manual Installation (Recommended)

1. Clone the repository:

   ```bash
   git clone https://github.com/kurojs/VoxAI.Dots.git
   cd VoxAI.Dots
   ```

2. Install system dependencies:

   ```bash
   sudo pacman -Syu yt-dlp mpv playerctl git bash flatpak curl jq
   ```

3. Install SpeechNote via Flatpak:

   ```bash
   flatpak install -y flathub net.mkiol.SpeechNote
   ```

4. Copy scripts to your local bin folder:

   ```bash
   mkdir -p ~/.local/bin
   cp bin/* ~/.local/bin/
   chmod +x ~/.local/bin/*
   ```

5. Configure Gemini CLI:

   ```bash
   mkdir -p ~/.gemini
   cp .gemini/GEMINI.md ~/.gemini/
   ```

6. Configure ghostty (optional):

   ```bash
   mkdir -p ~/.config/ghostty
   cp .config/ghostty/config ~/.config/ghostty/
   ghostty &
   ```

---

## 🤖 Usage

> ❗ **Important Warning**  
> Before proceeding with this step (required for Spotify integration), make sure to read `Docs/SPOTIFY.md` for detailed instructions.  
> This script requires your **Spotify Client ID** and **Client Secret** to function correctly.  
> **Do not skip this step** — proper configuration is essential.

### Spotify Token Management

Generate or refresh your Spotify token:

```bash
python3 bin/get_spotify_token.py
```

> ✅ **All Set**  
> If everything is configured correctly, you should be able to give these instructions to **Gemini CLI**, and it will successfully control your Spotify environment as expected.

> 📝 _Note: This workaround exists solely to support non-premium users who need Spotify interaction.  
> We replaced traditional playback methods with... creative engineering._

### Music Playback

- Play a specific song:

  ```bash
  play "Song Name"
  ```

- Spotify playlist playback:

  ```bash
  my_playlist.sh "https://open.spotify.com/playlist/PLAYLIST_ID"
  ```

- Control playback:
  - Next song:

    ```bash
    playerctl next
    ```

  - Previous song:

    ```bash
    playerctl previous
    ```

  - Pause/Resume:

    ```bash
    playerctl play-pause
    ```

---

## 📼 Configuration

### Gemini CLI Instructions

Gemini CLI is configured to execute specific actions based on predefined instructions. These instructions are defined in the `.gemini/GEMINI.md` file and include the following:

#### **General Instructions**

- **Enable voice synthesis**:
  - Instruction: `"start speaking now"` or `"speak out loud"`
  - Action: Executes the following command to read responses aloud:

    ```bash
    /bin/bash -c '~/.local/bin/speech_wrapper.sh "{output_text}"'
    ```

#### **Music Playback Instructions**

- **Play the next song**:
  - Instruction: `"next song"`
  - Action: Executes:

    ```bash
    playerctl next
    ```

- **Play the previous song**:
  - Instruction: `"previous song"`
  - Action: Executes:

    ```bash
    playerctl previous
    ```

- **Pause or resume music**:
  - Instruction: `"pause the music"` or `"resume the music"`
  - Action: Executes:

    ```bash
    playerctl play-pause
    ```

- **Play a specific song**:
  - Instruction: `"play {song}"`, `"I want to listen to {song}"`
  - Action: Executes:

    ```bash
    /bin/bash -c '~/.local/bin/speech_wrapper.sh "Playing {song}." & /home/kuro/.local/bin/play "{song}"'
    ```

---

## 🌀 Security

- Tokens are stored locally and expire after 1 hour.
- Avoid sharing your `spotify_token.json` file or exposing sensitive credentials.
- Use the Python script to refresh tokens securely.

> ✅ _Tokens are automatically refreshed, so you won’t need to manually log in or rerun the Python script — you might even forget it exists.  
> Note: The proper functioning of all Spotify-related scripts depends on this token file, so make sure it remains in your `bin/` directory._

---

## ☕ Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

---

## Acknowledgments

- [Gemini CLI](https://github.com/google/gemini-cli) by Google
- [SpeechNote](https://github.com/mkiol/SpeechNote) by mkiol
- [ghostty](https://github.com/ghostty-org/ghostty) by Charmbracelet
- Tools: `yt-dlp`, `mpv`, `playerctl`
- Arch Linux community and contributors

---

<footer>
<sub>Crafted with Determination 👾 by Kuro • Powered by Arch Linux • Maintained with professional passion</sub>
</footer>

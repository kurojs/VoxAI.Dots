# VoxAI.Dots

> **VoxAI.Dots** is an innovative series of Dots designed for GEMINI CLI, offering unique features like real-time voice synthesis, optimized music control, and a customizable floating terminal. Exclusively designed for Arch Linux systems and its derivatives, this project combines advanced automation, personalization, and multimedia control into an integrated and efficient workflow.

---

# Click to preview the demo

[![Demo](https://i.imgur.com/3DpT3fb.png)](https://kurojs.github.io/AssetHub//videos/2025-07-05%2001-03-55.mp4)

---

## Table of Contents

- [Features](#features)
- [Project Architecture and Structure](#project-architecture-and-structure)
- [Technical Requirements and Dependencies](#technical-requirements-and-dependencies)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Available Commands](#available-commands)
- [Troubleshooting](#troubleshooting)

---

## Main Features

- **Conversational interface:** Interact using Gemini CLI for a smooth experience.
- **Real-time voice synthesis:** Implemented with SpeechNote (installable via Flatpak) and a custom wrapper.
- **Optimized music control:** Compatible with `yt-dlp`, `mpv`, and `playerctl` for seamless music handling.
- **Optional floating terminal:** Powered by [ghostty](https://github.com/charmbracelet/ghostty) for a more immersive experience.
- **Advanced automation:** Scripts designed to maximize efficiency.
- **Flexible integration:** Easy setup for voice triggers and custom commands.
- **Logging and error handling:** Detailed logs for debugging and analysis.

---

## Project Architecture and Structure

```text
VoxAI.Dots/
├── README.md                # Main documentation
├── .gemini/
│   └── GEMINI.md            # Advanced configuration for Gemini CLI
├── bin/
│   ├── speech_wrapper.sh    # Wrapper for voice synthesis
│   └── play                 # Script for optimized music playback
├── .ghostty/
│   └── config               # Optional configuration for floating terminal
└── .gitignore               # Logs and temporary files exclusion
```

---

## Technical Requirements and Dependencies

### Required System Packages (Arch Linux and derivatives)

- **`yt-dlp`**: For music downloading and streaming.
- **`mpv`**: Multimedia player used for playback.
- **`playerctl`**: Universal control for multiple players.
- **`git` and `bash`**: Essential management and scripting tools.
- **`flatpak`**: Needed to install SpeechNote.
- **`go` or `yay`**: Required only if you decide to use ghostty.

### Additional Dependencies

- **[SpeechNote (Flatpak)](https://flathub.org/apps/net.mkiol.SpeechNote):** Key tool for real-time voice synthesis.

### 5. Easy Installation Method

To quickly set up **VoxAI.Dots** with all required configurations:

```bash
bash -c "$(curl -sSL https://raw.githubusercontent.com/kurojs/VoxAI.Dots/main/install.sh)"
```

> ⚠️ **Note:** Avoid using `curl ... | bash` directly — it breaks interactive prompts like `read`.  
> This method ensures the script can receive keyboard input properly.

Once started, the script will guide you through the setup process, including:

- Installing essential dependencies (`yt-dlp`, `mpv`, `playerctl`, etc.)
- Optionally installing [**SpeechNote**](https://flathub.org/apps/net.mkiol.SpeechNote)
- Optionally setting up a [**ghostty**](https://github.com/charmbracelet/ghostty) terminal configuration

---

💡 **Tip:** If you cloned this repository, you can also run the script locally:

```bash
./install.sh
```

## Complete Installation Guide

### 1. Install Gemini CLI

Make sure you have Node.js (version 20 or higher) installed.

Run Gemini CLI directly using:

```bash
npx https://github.com/google-gemini/gemini-cli
```

Alternatively, install it globally with:

```bash
npm install -g @google/gemini-cli
```

Then run:

```bash
gemini
```

### 2. Install System Dependencies

```bash
sudo pacman -Syu yt-dlp mpv playerctl git bash flatpak
```

### 3. Install SpeechNote via Flatpak

```bash
# Installation
flatpak install -y flathub net.mkiol.SpeechNote

# Run
flatpak run net.mkiol.SpeechNote
```

### 4. (Optional) Install Ghostty for Floating Terminal

You can install ghostty from the official repository or from AUR:

- **From Go (recommended for latest version):**

```bash
go install github.com/ghostty-org/ghostty@latest
```

- **From AUR using yay:**

```bash
yay -S ghostty-git
```

More info and releases at: [ghostty-org/ghostty](https://github.com/ghostty-org/ghostty)

### 5. Clone the Repository and Prepare Scripts

```bash
git clone https://github.com/tuusuario/VoxAI.Dots.git
cd VoxAI.Dots
mkdir -p ~/.local/bin
cp scripts/speech_wrapper.sh scripts/play ~/.local/bin/
chmod +x ~/.local/bin/speech_wrapper.sh ~/.local/bin/play
```

---

## Usage

- Run Gemini CLI and use the voice triggers defined in `GEMINI.md`.
- The scripts `speech_wrapper.sh` and `play` should be in your PATH (`~/.local/bin`).
- The voice wrapper logs in `~/.local/share/speech_wrapper.log`.
- Music control is seamless and does not interrupt the floating terminal.

---

## Configuration

### 1. Configure Gemini CLI

```bash
mkdir -p ~/.gemini/
cp .gemini/GEMINI.md ~/.gemini/GEMINI.md
```

### 2. (Optional) Configure ghostty

```bash
mkdir -p ~/.config/ghostty
cp .ghostty/config ~/.config/ghostty/config
ghostty &
```

---

## Available Commands

### Practical Usage Example

#### Scenario 1: Music Playback Control

- User: "I want to listen to Bohemian Rhapsody."
  - Executed command: `play "Bohemian Rhapsody Queen"`
  - Result: The song plays directly using `yt-dlp` and `mpv`.

- User: "Pause the music."
  - Executed command: `playerctl play-pause`
  - Result: Playback pauses.

#### Scenario 2: Activate Voice Synthesis

- User: "Speak from now on."
  - Executed command: `speech_wrapper.sh "Text to synthesize"`
  - Result: The text is read aloud using SpeechNote.

### Activate voice synthesis

- Say: `speak from now on` or `speak aloud` (activates automatic reading of Gemini responses)

### Music control

- `next song` → `playerctl next`
- `previous song` → `playerctl previous`
- `pause the music` / `resume the music` → `playerctl play-pause`
- `play {song}` / `start {song}` / `I want to listen to {song}` → executes `play "song name"`

### Example use of the play script

```bash
play "Party all the time"
```

---

## Troubleshooting

- **SpeechNote not responding:** Verify Flatpak is properly installed and the `net.mkiol.SpeechNote` package is available. Make sure to install a voice model.
- **No music playback:** Ensure `yt-dlp` and `mpv` are installed and working.
- **Floating terminal doesn't appear:** Confirm ghostty is installed in its latest version and is in your PATH.
- **Script permissions:** If scripts don't run, check execution permissions (`chmod +x`).
- **Logs:** Check `~/.local/share/speech_wrapper.log` for voice synthesis error details.

---

## Credits and Acknowledgments

- Gemini CLI by Google
- SpeechNote by [mkiol](https://flathub.org/apps/net.mkiol.SpeechNote)
- ghostty by Charmbracelet
- yt-dlp, mpv, playerctl, bash, Arch Linux community

---

> For support, suggestions, or contributions, open an issue or pull request in the official repository.

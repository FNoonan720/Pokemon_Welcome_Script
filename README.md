# Terminal Welcome Script

A bash script that displays system information and a random Pokemon sprite when opening a new terminal session.

<img width="815" height="706" alt="example" src="https://github.com/user-attachments/assets/57d72c13-ac91-4471-ac14-a663a62c2b71" />

## Features

- ASCII art "WELCOME" banner
- Random Pokemon sprite displayed in terminal
- System information: date, OS, processor, kernel, memory usage
- Optional weather display (cached for fast startup)
- 1/256 chance of showing a shiny Pokemon variant

## Requirements

- `chafa` - Terminal image viewer for Pokemon sprites
- `curl` - For fetching Pokemon sprites and weather data
- Standard Linux tools: `shuf`, `free`, `stat`, `grep`, `sed`

### Installing chafa

```bash
# Ubuntu/Debian
sudo apt install chafa

# Fedora
sudo dnf install chafa

# macOS
brew install chafa
```

## Installation

```bash
# Clone the repository
git clone https://github.com/FNoonan720/welcome.git
cd welcome

# Install to your shell config (adds to ~/.bashrc or ~/.zshrc)
./install.sh
```

## Usage

The script runs automatically when you open a new terminal after installation. You can also run it manually:

```bash
./welcome.sh
```

## Weather Display (Optional)

To enable weather display, set the `WELCOME_LOCATION` environment variable in your shell config:

```bash
export WELCOME_LOCATION="New York,NY"
```

Weather is fetched from wttr.in in the background and cached for 30 minutes to avoid slowing down terminal startup.

## Uninstallation

```bash
./uninstall.sh
```

This removes the script from your shell config but keeps the script files in place

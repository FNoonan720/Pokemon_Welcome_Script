#!/bin/bash

# Install script for terminal welcome message
# Adds welcome.sh to your shell configuration

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WELCOME_SCRIPT="$SCRIPT_DIR/welcome.sh"
MARKER="# WELCOME_MESSAGE_SCRIPT"

# Detect shell config file
detect_shell_config() {
    if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
        echo "$HOME/.zshrc"
    else
        echo "$HOME/.bashrc"
    fi
}

install_welcome() {
    local config_file=$(detect_shell_config)

    # Check if welcome.sh exists
    if [ ! -f "$WELCOME_SCRIPT" ]; then
        echo "Error: welcome.sh not found at $WELCOME_SCRIPT"
        exit 1
    fi

    # Check if already installed
    if grep -q "$MARKER" "$config_file" 2>/dev/null; then
        echo "Welcome message is already installed in $config_file"
        echo "Run ./uninstall.sh to disable it first."
        exit 0
    fi

    # Add to shell config
    echo "" >> "$config_file"
    echo "$MARKER" >> "$config_file"
    echo "if [ -f \"$WELCOME_SCRIPT\" ]; then" >> "$config_file"
    echo "    source \"$WELCOME_SCRIPT\"" >> "$config_file"
    echo "fi" >> "$config_file"
    echo "$MARKER END" >> "$config_file"

    echo "Welcome message installed successfully!"
    echo "Config file: $config_file"
    echo ""
    echo "Restart your terminal or run: source $config_file"
}

install_welcome

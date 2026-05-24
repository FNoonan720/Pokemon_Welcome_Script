#!/bin/bash

# Uninstall script for terminal welcome message
# Removes welcome.sh from your shell configuration (does not delete the scripts)

MARKER="# WELCOME_MESSAGE_SCRIPT"

# Detect shell config file
detect_shell_config() {
    if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
        echo "$HOME/.zshrc"
    else
        echo "$HOME/.bashrc"
    fi
}

uninstall_welcome() {
    local config_file=$(detect_shell_config)

    # Check if installed
    if ! grep -q "$MARKER" "$config_file" 2>/dev/null; then
        echo "Welcome message is not currently installed in $config_file"
        exit 0
    fi

    # Create backup
    cp "$config_file" "${config_file}.backup"
    echo "Backup created: ${config_file}.backup"

    # Remove the welcome message block (macOS sed requires an explicit empty backup extension)
    if [ "$(uname -s)" = "Darwin" ]; then
        sed -i '' "/$MARKER/,/$MARKER END/d" "$config_file"
        sed -i '' -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$config_file" 2>/dev/null
    else
        sed -i "/$MARKER/,/$MARKER END/d" "$config_file"
        sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$config_file" 2>/dev/null
    fi

    echo "Welcome message disabled successfully!"
    echo "Config file: $config_file"
    echo ""
    echo "To re-enable, run: ./install.sh"
    echo "Your welcome scripts are still in place and were not deleted."
}

uninstall_welcome

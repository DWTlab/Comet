#!/bin/bash

# -----------------------------------------------------------------------------
# Installer for Comet
#
# This script installs the Comet scripts to the ~/.comet directory
# and adds the ~/.comet directory to your PATH.
# -----------------------------------------------------------------------------

# This makes the script stop if any command fails.
set -e

# The directory to install Comet to.
INSTALL_DIR="$HOME/.comet"

# Create the installation directory if it doesn't exist.
echo "Creating installation directory: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Get the directory where this script is located.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy the Comet scripts to the installation directory.
if [ "$SCRIPT_DIR" != "$INSTALL_DIR" ]; then
  echo "Copying Comet scripts to $INSTALL_DIR"
  cp "$SCRIPT_DIR/comet.sh" "$INSTALL_DIR/"
  cp "$SCRIPT_DIR/config.sh" "$INSTALL_DIR/"
  cp "$SCRIPT_DIR/variables.sh" "$INSTALL_DIR/"
fi

# Make the main comet.sh script executable.
echo "Making comet.sh executable..."
chmod +x "$INSTALL_DIR/comet.sh"

# Determine the user's shell configuration file.
if [ -n "$BASH_VERSION" ]; then
  SHELL_CONFIG_FILE="$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
  SHELL_CONFIG_FILE="$HOME/.zshrc"
else
  SHELL_CONFIG_FILE="$HOME/.profile"
fi

# Add the Comet directory to the user's PATH if it's not already there.
if ! grep -q "export PATH=\"$INSTALL_DIR:\$PATH\"" "$SHELL_CONFIG_FILE"; then
  echo "Adding Comet to your PATH in $SHELL_CONFIG_FILE"
  echo "" >> "$SHELL_CONFIG_FILE"
  echo "# Add Comet to PATH" >> "$SHELL_CONFIG_FILE"
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_CONFIG_FILE"
else
  echo "Comet is already in your PATH."
fi

# Add an alias for the comet command.
if ! grep -q "alias comet=" "$SHELL_CONFIG_FILE"; then
  echo "Adding 'comet' alias to $SHELL_CONFIG_FILE"
  echo "" >> "$SHELL_CONFIG_FILE"
  echo "# Alias for Comet" >> "$SHELL_CONFIG_FILE"
  echo "alias comet='sh $HOME/.comet/comet.sh'" >> "$SHELL_CONFIG_FILE"
  echo "Installation complete!"
  echo "Please restart your terminal or run 'source $SHELL_CONFIG_FILE' to use the 'comet' command."
else
  echo "'comet' alias already exists."
fi

echo "Comet installation finished."

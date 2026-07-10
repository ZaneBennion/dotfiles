#!/usr/bin/env bash

# Ensure the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script with sudo."
  exit 1
fi

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"
SYSTEM_DIR="$DOTFILES_DIR/system"

echo "Deploying system configurations to root (/) ..."

# Sync the entire contents of the system/ directory to /
# The trailing slash on $SYSTEM_DIR/ is critical!
rsync -av --chown=root:root "$SYSTEM_DIR/" /

echo "System configurations applied successfully!"

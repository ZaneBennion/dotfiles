#!/usr/bin/env bash

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"
SYSTEM_DIR="$DOTFILES_DIR/system"

# 1. Define every system file you want to track here
FILES_TO_SYNC=(
    "/etc/sddm.conf"
    "/usr/share/sddm/themes/reactionary"
    "/etc/keyd/default.conf"
)

echo "Pulling specific system files back into the repository..."

# 2. Loop through the array and sync each file individually
for file in "${FILES_TO_SYNC[@]}"; do
    if [ -e "$file" ]; then
        # -R (--relative) ensures /etc/pacman.conf lands in system/etc/pacman.conf
        sudo rsync -avR --chown="$USER":"$USER" "$file" "$SYSTEM_DIR/"
    else
        echo "Warning: File $file does not exist on the system. Skipping."
    fi
done

echo "Pull complete. Ready to commit!"

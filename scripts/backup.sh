#!/bin/bash

# Source the log script
source "$(dirname "$0")/../log.sh"
read -p "Enter the file or directory to back up: " src
read -p "Enter the backup destination: " dest

if [ ! -e "$src" ]; then
    echo "Error: Source path does not exist."
    log_action "Backup failed: $src (Path does not exist)"
    exit 1
fi

mkdir -p "$dest"

if [ -d "$src" ]; then
    cp -r "$src" "$dest"
    echo "Directory backed up successfully."
    log_action "Backed up directory: $src to $dest"
elif [ -f "$src" ]; then
    cp "$src" "$dest"
    echo "File backed up successfully."
    log_action "Backed up file: $src to $dest"
else
    echo "Error: Invalid source type."
    log_action "Backup failed: $src (Invalid source type)"
fi

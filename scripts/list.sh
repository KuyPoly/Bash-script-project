#!/bin/bash

# Source the log script
source "$(dirname "$0")/../log.sh"

read -p "Enter the directory or file path: " path

if [ -e "$path" ]; then
    ls -lah "$path"
    log_action "Listed contents of: $path"
else
    echo "Error: Path does not exist."
    log_action "Failed to list: $path (Path does not exist)"
fi

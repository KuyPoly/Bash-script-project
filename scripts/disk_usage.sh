#!/bin/bash

# Source the log script
source "$(dirname "$0")/../log.sh"

# Function to display disk usage of a directory
display_disk_usage() {
    local path="$1"

    # Check if path exists and is a directory
    if [ -d "$path" ]; then
        echo "Disk usage for directory: $path"
        echo "--------------------------------"

        # Get disk usage with human-readable format
        total_size=$(du -sh "$path" | cut -f1)
        file_count=$(find "$path" -type f | wc -l)
        dir_count=$(find "$path" -type d | wc -l)

        echo "Total size: $total_size"
        echo "Files: $file_count"
        echo "Subdirectories: $((dir_count - 1))"  # subtract 1 for the parent directory
        echo "----------------------------------"

        # Optional: show largest files/subdirectories
        echo "Top 5 largest items:"
        du -h "$path"/* | sort -rh | head -n 5

        # Log action
        log_action "Displayed disk usage for directory: $path (Size: $total_size, Files: $file_count, Subdirectories: $((dir_count - 1)))"
    else
        echo "Error: '$path' is not a valid directory or does not exist." >&2
        log_action "Failed to display disk usage: '$path' is not a valid directory."
        return 1
    fi
}

# Main script execution
if [ $# -eq 1 ]; then
    # Use command line argument if provided
    display_disk_usage "$1"
else
    # Interactive mode
    read -p "Enter directory path to analyze: " path

    if [ -n "$path" ]; then
        display_disk_usage "$path"
    else
        echo "Error: No directory path provided." >&2
        log_action "Failed to display disk usage: No directory path provided."
    fi
fi


#!/bin/bash

# Source the log script
source "$(dirname "$0")/../log.sh"

# Function to count the number of files in a directory
count_files() {
    local dir=$1

    # Check if directory exists
    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' does not exist."
        log_action "Failed to count files: Directory '$dir' does not exist."
        return 1
    fi

    # Count the number of files
    local file_count=$(find "$dir" -type f | wc -l)
    
    echo "Number of files in '$dir': $file_count"
    log_action "Counted $file_count files in '$dir'."
}

# Get user input if no command-line argument is provided
if [ $# -eq 1 ]; then
    count_files "$1"
else
    read -p "Enter the directory path: " dir
    count_files "$dir"
fi

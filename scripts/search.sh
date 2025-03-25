#!/bin/bash#!/bin/bash
# Source the log script
source "$(dirname "$0")/../log.sh"

# Function to search for files
search_files(){
    local directory="$1"
    local pattern="$2"

    if [ -d "$directory" ]; then
        echo "Searching for '$pattern' in directory: $directory"
        # Find files that match the pattern
        files=$(find "$directory" -type f -name "$pattern")

        # Check if any files were found
        if [ -z "$files" ]; then
            echo "No files matching '$pattern' found in '$directory'."
	    log_action "Search for '$pattern' in '$directory' - No file found."
        else
            echo "$files"
	    log_action "Search for '$pattern' in '$directory' - Found $(echo "$files" | wc -l) file(s)."
        fi
    else
        echo "Error: '$directory' is not a valid directory."
	log_action "Search failed: Invalid directory '$directory'."
    fi
}

# Get user input
read -p "Enter the directory to search in: " dir
read -p "Enter the file name or extension (e.g., '*.txt' or 'example.txt'): " filename

# Run search function
search_files "$dir" "$filename"

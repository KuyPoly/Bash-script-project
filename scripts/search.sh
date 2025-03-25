#!/bin/bash#!/bin/bash

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
        else
            echo "$files"
        fi
    else
        echo "Error: '$directory' is not a valid directory."
    fi
}

# Get user input
read -p "Enter the directory to search in: " dir
read -p "Enter the file name or extension (e.g., '*.txt' or 'example.txt'): " filename

# Run search function
search_files "$dir" "$filename"

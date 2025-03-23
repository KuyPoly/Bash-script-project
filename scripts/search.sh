#!/bin/bash

#Funtion to search for files
search_files(){
	local directory="$1"
	local pattern="$2"

	if [ -d "$directory" ]; then
		echo "Searching for '$pattern' in directory: $directory"
		find "$directory" -type f -name "$pattern"
	else
		echo "Error: '$directory' is not a valid directory."
	fi
}

#Get user input
read -p "Enter the directory to search in: " dir
read -p "Enter the file name or extension (e.g., '*.txt' or 'example.txt'): " filename

#run search function
search_files "$dir" "$filename"

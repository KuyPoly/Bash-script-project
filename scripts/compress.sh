#!/bin/bash

#Function to compress files or directories
compress_files(){
	local input="$1"
	local output="$2"

	if [ -z "$input" ] || [ -z "$output" ]; then
		echo "Usage: ./compress.sh <file-or-directory> <output-compressed-file>"
		return 1
	fi
	
	if [ -f "$input" ] || [ -d "$input" ]; then
		echo "Compressing '$input' into '$output.tar.gz' ..."
		tar -czf "$output.tar.gz" "$input"
		echo "Compression complete!"
	else
		echo "Error: '$input' is not a valid file or directory."
	fi
}

#Get user input for file or directory to compress and output filename
read -p "Enter the file or directory to compress: " input
read -p "Enter the name for the compressed file (without extension): " output

#call the compress function
compress_files "$input" "$output"

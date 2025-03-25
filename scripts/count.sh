#!/bin/bash

# Function to count the number of files in a subdirectory of a given directory
count_files_in_subdirectory(){
    local parent_dir=$1
    local subdirectory=$2

    if [ -d "$parent_dir/$subdirectory" ]; then
	local file_count=$(find "$parent_dir/$subdirectory" -type f | wc -l)
	echo "Number of files in '$parent_dir/$subdirectory': $file_count"
    else
	echo "The subdirectory '$subdirectory' does not exist in '$parent_dir'."
    fi
}

#!/bin/bash

# Function to compress using tar + xz
compress_tar_xz() {
    echo "Compressing directory using tar + xz..."
    tar -cJvf "$1.tar.xz" "$2"  # -c creates, -J for xz compression, -v for verbose, -f for file name
    echo "Directory $2 has been compressed to $1.tar.xz"
}

# Function to compress using zip
compress_zip() {
    echo "Compressing using zip..."
    zip -r "$1.zip" "$2"  # -r for recursive (to include subdirectories)
    echo "File/Directory $2 has been compressed to $1.zip"
}

# Function to compress using 7z
compress_7z() {
    echo "Compressing using 7z..."
    7z a "$1.7z" "$2"  # 'a' means add files to archive
    echo "File/Directory $2 has been compressed to $1.7z"
}

# Main menu for user input
echo "Choose compression method:"
echo "1. tar + xz (for directories)"
echo "2. zip (for files or directories)"
echo "3. 7z (for files or directories)"
read -p "Enter your choice (1-3): " choice

# Get the file or directory to compress
read -p "Enter the path of the file/directory to compress: " file_or_dir

# Handle user choice
case $choice in
    1)
        # Compress with tar + xz (for directories)
        if [ -d "$file_or_dir" ]; then
            read -p "Enter the name for the compressed archive (without extension): " archive_name
            compress_tar_xz "$archive_name" "$file_or_dir"
        else
            echo "Error: $file_or_dir is not a valid directory."
        fi
        ;;
    2)
        # Compress with zip (for files or directories)
        if [ -e "$file_or_dir" ]; then
            read -p "Enter the name for the compressed archive (without extension): " archive_name
            compress_zip "$archive_name" "$file_or_dir"
        else
            echo "Error: $file_or_dir is not a valid file or directory."
        fi
        ;;
    3)
        # Compress with 7z (for files or directories)
        if [ -e "$file_or_dir" ]; then
            read -p "Enter the name for the compressed archive (without extension): " archive_name
            compress_7z "$archive_name" "$file_or_dir"
        else
            echo "Error: $file_or_dir is not a valid file or directory."
        fi
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        ;;
esac


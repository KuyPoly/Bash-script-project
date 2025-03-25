#!/bin/bash

read -p "Enter the file or directory to back up: " src
read -p "Enter the backup destination: " dest

if [ ! -e "$src" ]; then 
	echo "Error!! Source path doesn't exist!"
	exit 1
fi

mkdir -p "$dest"

if [ -d "$src" ]; then
	cp -r "$src" "$dest"
	echo "Directory backed up successfully!"
elif [ -f "$src" ]; then
	cp "$src" "$dest"
	echo "File backed up successfully!"
else 
	echo "Error! Invalid source!"
fi

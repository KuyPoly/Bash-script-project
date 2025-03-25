#!/bin/bash

read -p "Enter the directory or file path: " path
if [ -e "$path" ]; then
	ls -lah "$path"
else 
	echo "Error!! Path does not exist!"
fi


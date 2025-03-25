#!/bin/bash

while(true); do
	echo "1. List Files"
	echo "2. Backup Files"
	echo "3. Count Files"
	echo "4. Disk Usage"
	echo "5. Search Files"
	echo "6. Compress Files"
	echo "7. Exit"
	read -p "Choose an option: " choice

	case $choice in
		1) bash scripts/list.sh ;;
		2) bash scripts/backup.sh ;;
		3) bash scripts/count.sh ;;
		4) bash scripts/disk_usage.sh ;;
		5) bash scripts/search.sh ;;
		6) bash scripts/compress.sh ;;
		7) exit 0;;
		*) echo "Invalid choice! Try again" ;;
	esac
done

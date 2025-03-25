# **Bash File Manager**
## **Overview**
The Bash File Manager is a shell-based program designed to perform various file and directory management tasks efficiently. It supports listing files, creating backups, counting files, checking disk usage, searching for files, compressing files, and maintaining a log of all operations.

## **Features**
1. **List Files and Directories** – Display detailed information about files and directories.
2. **Backup Files and Directories** – Create backups at a user-specified location.
3. **Count Files** – Count the number of files in a given directory.
4. **Check Disk Usage** – Display the disk usage statistics of a directory.
5. **Search for Files** – Locate files by name or extension.
6. **Compress Files and Directories** – Supports .tar.xz, .zip, and .7z formats.
7. **Logging** – Logs all actions in script.log.

## **Structure**
 /BashFileManager
│── script.log           # Stores log files
│── scripts/             # Contains individual script functions
│── README.md            # Documentation
│── log.sh               # Logging script
│── main.sh              # Main script entry point

## **Installation**
- Linux or macOS with bash
- tar, zip, 7z, and find utilities installed
- Git

## **Setup**
1. Clone the git repository
2. Give execute permission
3. Run the program

## **Logging**
All operations are recorded in script.log. You can view by "cat script.log"

## **Usage**
Run main.sh to start. It will provide an interactive menu to choose function. Follow the prompt to perform any task.

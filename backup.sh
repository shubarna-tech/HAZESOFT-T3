#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory-to-backup>"
    exit 1
fi

# backup directory
directory_to_backup="$1"
backup_directory="path_to_your_backup_directory"

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_filename="backup_${timestamp}.tar.gz"

# tar the file to backup
tar -czf "${backup_directory}/${backup_filename}" -C "${directory_to_backup}" .

# Checking backup conditions
if [ "$?" -eq 0 ]; then
    echo "Backup successful. Archive saved to: ${backup_directory}/${backup_filename}"
else
    echo "Backup failed."
fi
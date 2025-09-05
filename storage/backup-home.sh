#!/bin/bash

set -e

#Read the username of User's home folder
echo "What is the name of the user whose home folder is being backed up?"
read username

#Name of folder to backup
echo "Where should the backup be saved? (example: /mnt/backup)"
read dest

#Check if folder exists
if [ ! -d "$dest" ]; then
    echo "Error: $dest is not a valid directory"
    exit 1
fi

#Folders to not back up, if any
echo "Enter which folders from /home/$username you don't want to backup, separated by space (example: Downloads Videos...)"
read excludes

#adding exclude arguments for folders
excludes_arg=""
for folder in $excludes; do
    excludes_arg="$excludes_arg --exclude=./$folder --exclude=./$folder/*"
done

timestamp=$(date +"%d-%m-%Y-%H-%M")
backup_name="backup-$timestamp.tar.gz"
backup_path="$dest/$backup_name"

tar -czf "$backup_path" $excludes_arg -C /home/$username .

echo "Backup complete! Saved at: $backup_path"
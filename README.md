# Bash Scripts Collection
This repository will contain various Bash scripts.

---

## Scripts

### storage/format-usb.sh
Safely formats a USB drive that containes an OS image.  

**Features:**
- Lists all disks (`fdisk -l`) so you can identify the USB.  
- Checks the selected device is real (`-b`) and removable.  
- Shows existing filesystem/partition signatures before wiping.  
- Asks for double confirmation before erasing.  
- Launches `cfdisk` for manual partition creation.  
- Formats the new partition as FAT32 with a custom label.  


**Warning**: This script is destructive. Running it on the wrong disk will erase all data.  

**Usage:**
```bash
chmod +x storage/format-usb.sh
./storage/format-usb.sh why doesnt it have
```

### storage/backup-home.sh
Creates a compressed backup (.tar.gz) of a user’s home directory with support for excluding specific folders.

**Features:**
- Prompts for the username and the backup destination directory.
- Verifies that the destination directory exists before proceeding.
- Excludes folders if specified (e.g. Downloads .cache .mozilla).
- Creates a timestamped archive (backup-DD-MM-YYYY-HH-MM.tar.gz) to avoid overwriting old backups.
- Uses tar with gzip compression for efficient storage.

**Note**: This script does not check available disk space. Make sure the destination drive has enough free space before running it.

**Usage:**
```bash
chmod +x storage/backup-home.sh
./storage/backup-home.sh
```

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

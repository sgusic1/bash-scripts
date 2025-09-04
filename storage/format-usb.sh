#!/bin/bash
#format-usb.sh
#Author: Sabina
#Date: 08.12.2023.
#Description: Safely format a USB drive that has an OS image

set -e

sudo fdisk -l
echo Type yes to continue or no to abort:
read answer

format_disk(){
    echo Write the name of the USB \(Disk\) you want to format:
    read usb

    #Check the device exists
    if [ ! -b "$usb" ]; then
        echo "Error: $usb is not a valid block device!"
        exit 1
    fi

    #Check if usb is removable
    if [ "$(cat /sys/block/$(basename "$usb")/removable)" -ne 1 ]; then
        echo "Error: $usb is not a removable USB drive!"
        exit 1
    fi

    #Show existing signatures
    echo "Existing signatures on $usb:"
    wipefs -n "$usb"

    #Confirmation
    echo "WARNING: This will erase complete data on the $usb"
    read -p "Type yes to proceed" confirm

    if [ "$confirm" != 'yes' ]; then
        echo "Formatting is aborted"
        exit 1
    fi

    echo Write the name of the partition:
    read device_name

    sudo wipefs --all "$usb"
    echo In the next window choose:
    echo dos -\> new -\> enter -\> primary -\> write: yes -\> quit
    sleep 15
    sudo cfdisk "$usb"

    echo Pick a name for the USB drive \(upper case\):
    read name
    sudo mkfs.vfat -n "$name" "$device_name"
    echo Formatting USB disk has been completed!

}

case "$answer" in
     yes)
         format_disk
         ;;
     no) 
         echo Formatting is aborted!
         exit 0
         ;;
     *)
         echo Invalid input.
         exit 1
esac

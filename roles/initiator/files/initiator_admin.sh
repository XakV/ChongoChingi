#!/bin/bash

### Do the basic portal discovery and login

TPORTAL=10.0.0.6
TARGETNAME=$(iscsiadm --mode discovery --type sendtargets --portal $TPORTAL discover | grep $HOSTNAME | cut -d " " -f 2)
iscsiadm --mode node --name $TARGETNAME --portal $TPORTAL --login

### Function to setup the device for mounting

function partition_iscsi_dev() {
    if [ -b /dev/$(lsblk -o NAME,VENDOR,WWN -n | grep LIO | cut -d' ' -f 1) ]; then
    	iscsi_blk_dev=/dev/$(lsblk -o NAME,VENDOR,WWN -n | grep LIO | cut -d' ' -f 1)
	iscsi_part_chk=$(lsblk -nl $iscsi_blk_dev | wc -l)
	if [ $iscsi_part_chk -eq 1 ];
	then
	    parted -s $iscsi_blk_dev mkpart primary xfs
	fi
	part_num=1
	iscsi_part_uuid=$(blkid $iscsi_blk_dev$1 | cut -d'"' -f 2)
	echo "UUID=$iscsi_part_uuid	/opt/Backups    xfs   _netdev  0  2" >> /etc/fstab
    else
	exit 1
    fi

### Main

partition_iscsi_dev
mount -o remount -a
exit 0
	    
    


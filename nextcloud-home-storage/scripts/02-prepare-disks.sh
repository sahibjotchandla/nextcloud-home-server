#!/usr/bin/env bash
set -e

DATA_DISK="/dev/sdb"   # placeholder for 220GB
EXTRA_DISK="/dev/sdc"  # placeholder for 110GB

sudo mkfs.ext4 -F "${DATA_DISK}"
sudo mkfs.ext4 -F "${EXTRA_DISK}"

sudo mkdir -p /mnt/nextcloud-data
sudo mkdir -p /mnt/nextcloud-extra

sudo mount "${DATA_DISK}" /mnt/nextcloud-data
sudo mount "${EXTRA_DISK}" /mnt/nextcloud-extra

sudo chown -R www-data:www-data /mnt/nextcloud-data /mnt/nextcloud-extra

echo "Disks mounted. Update /etc/fstab using configs/system/fstab.example."

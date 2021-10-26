#!/bin/bash

dev='/dev/vda'
umount "$dev"
printf "o\nn\np\n1\n\n\nw\n" | fdisk "$dev"
mkfs.ext4 "${dev}1"

pacman -Syy

mount /dev/vda1 /mnt

pacstrap /mnt base linux linux-firmware nano git

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

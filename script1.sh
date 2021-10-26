#!/bin/bash

dev='/dev/vda'
umount "$dev"
printf "o\nn\np\n1\n\n\nw\n" | fdisk "$dev"
mkfs.ext4 "${dev}1"

pacman -Syy

mount /dev/vda1 /mnt

pacstrap /mnt base linux linux-firmware nano git

genfstab -U /mnt >> /mnt/etc/fstab

echo 'git clone https://github.com/mrbeebenson/arch-install && cd arch-install && chmod +x script2.sh' | arch-chroot /mnt

arch-chroot /mnt

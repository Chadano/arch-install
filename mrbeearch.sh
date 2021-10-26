#!/bin/bash

dev='/dev/sda'
umount "$dev"
printf "o\nn\np\n1\n\n\nw\n" | fdisk "$dev"
mkfs.ext4 "${dev}1"

pacman -Syy

mount /dev/sda1 /mnt

pacstrap /mnt base linux linux-firmware nano

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

timedatectl set-timezone Europe/London

echo LANG=en_GB.UTF-8 > /etc/locale.conf

export LANG=en_GB.UTF-8

echo adam-vm > /etc/hostname

mv hosts /etc/hosts

pacman -S dhcpcd grub

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S sudo xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xorg networkmanager

systemctl enable lightdm.service
systemctl enable NetworkManager.service

useradd -m -G wheel adam

passwd adam

EDITOR=nano visudo

echo "---"
echo "finished"
echo "---"

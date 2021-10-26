#!/bin/bash

dev='/dev/sda'
umount "$dev"
printf "o\nn\np\n1\n\n\nw\n" | fdisk "$dev"
mkfs.ext4 "${dev}1"

pacman -Syy

mount /dev/sda1 /mnt

pacstrap /mnt base linux linux-firmware nano

genfstab -U /mnt >> /mnt/etc/fstab

echo 'timedatectl set-timezone Europe/London' | arch-chroot /mnt

echo 'echo LANG=en_GB.UTF-8 > /etc/locale.conf' | arch-chroot /mnt

echo 'export LANG=en_GB.UTF-8' | arch-chroot /mnt

echo 'echo adam-vm > /etc/hostname' | arch-chroot /mnt

echo 'mv hosts /etc/hosts' | arch-chroot /mnt

echo 'pacman -S dhcpcd grub sudo xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xorg networkmanager neofetch' | arch-chroot /mnt

echo 'grub-install /dev/sda' | arch-chroot /mnt

echo 'grub-mkconfig -o /boot/grub/grub.cfg' | arch-chroot /mnt

echo 'systemctl enable lightdm.service' | arch-chroot /mnt
echo 'systemctl enable NetworkManager.service' | arch-chroot /mnt

echo 'useradd -m -G wheel adam'  | arch-chroot /mnt

echo 'passwd adam' | arch-chroot /mnt

echo 'EDITOR=nano visudo' | arch-chroot /mnt

echo 'echo "---"' | arch-chroot /mnt
echo 'echo "finished"' | arch-chroot /mnt
echo 'echo "---"' | arch-chroot /mnt

#!/bin/bash

timedatectl set-timezone Europe/London

echo LANG=en_GB.UTF-8 > /etc/locale.conf

export LANG=en_GB.UTF-8

echo arch-linux > /etc/hostname

mv hosts /etc/hosts

pacman -S dhcpcd grub sudo gnome xorg networkmanager neofetch

grub-install /dev/vda

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable gdm.service
systemctl enable NetworkManager.service

useradd -m -G wheel user

passwd user

EDITOR=nano visudo

echo "---"
echo "finished"
echo "---"

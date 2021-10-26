#!/bin/bash

timedatectl set-timezone Europe/London

echo LANG=en_GB.UTF-8 > /etc/locale.conf

export LANG=en_GB.UTF-8

echo adam-vm > /etc/hostname

mv hosts /etc/hosts

pacman -S dhcpcd grub sudo xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xorg networkmanager

grub-install /dev/vda

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable lightdm.service
systemctl enable NetworkManager.service

useradd -m -G wheel adam

passwd adam

EDITOR=nano visudo

echo "---"
echo "finished"
echo "---"

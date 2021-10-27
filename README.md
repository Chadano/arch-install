# MrBeeBenson Arch Linux installation script
Here is my series of Arch Linux installation scripts designed to be used for Arch Linux inside of a VM. 

I typically use Arch Linux as my go-to tinkering operating system inside of a VM and so I decided to automate the installation process.

# Method

Step 1: Install git after booting

`pacman -Syy git`

Step 2: Clone this repository & enter into the cloned directory

`git clone https://github.com/mrbeebenson/arch-install && cd arch-install`

Step 3: Flag "script1.sh" as executable

`chmod +x script1.sh`

Step 4: Run "script1.sh"

`./script1.sh`

Step 5: enter into arch-install directory from the arch-chroot

`cd arch-install`

Step 6: Run the script corrisponding to the desktopp environment you wish to use

`./gnome.sh` - Will install the rest of Arch Linux with the GNOME Desktop Environment

`./xfce.sh` - Will install the rest of Arch Linux with the XFCE Desktop Environment

`./kde.sh` - Will install the rest of Arch Linux with KDE

#!/usr/bin/env bash

# crossgrub theme: https://github.com/krypciak/crossgrub

cd ~/
git clone https://github.com/krypciak/crossgrub
sudo bash ./install crossgrub/install.sh
echo "add the following line to your /etc/default/grub"
echo "GRUB_THEME=/boot/grub/themes/crossgrub/theme.txt"
sudo nvim /etc/default/grub 
sudo grub-mkconfig -o /boot/grub/grub.cfg
rm -rf crossgrub

#!/usr/bin/env bash

# billy'billys-agent-grub2-theme

cd ~/
git clone https://gitlab.com/Drorago/billys-agent-grub2-theme.git
sudo cp -r billys-agent-grub2-theme/ /usr/share/grub/themes/ 
sudo nvim /etc/default/grub 
sudo grub-mkconfig -o /boot/grub/grub.cfg
rm -rf billys-agent-grub2-theme/

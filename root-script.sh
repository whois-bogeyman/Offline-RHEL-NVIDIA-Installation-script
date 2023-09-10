#!/bin/bash

cd /etc/modprobe.d/
touch nvidia-installer-disable-nouveau.conf
echo "
blacklist nouveau
blacklist Ibm-nouveau
options nouveau modeset=0
alias nouveau off
alias ibm-nouveau off " >> nvidia-installer-disable-nouveau.conf
dracut--force
grub2-mkconfig -o /boot/eft/EFI/redhat/grub.cfg
lsmod grep nouveau
sh ./NVIDIA-Linux.*.x86-64.run
reboot

#!/bin/bash

set -e
set -x

apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
# Install i3
apt-get -y install i3 \
                   ubuntu-drivers-common \
                   mesa-utils \
                   mesa-utils-extra \
                   xorg \
                   xserver-xorg \
                   nemo \
                   xfce4-terminal \
                   numlockx \
                   xautolock \
                   scrot \
                   xbacklight \
                   intel-microcode \
                   fonts-font-awesome \
                   pulse-audio \
                   xfce4-notifyd \
                   wicd

# Install applications
apt-get -y install vim \
                   curl \
                   wget \
                   ssh \
                   gnupg \
                   git \
                   htop \
                   tree

sed -i -e s/GRUB_CMDLINE_LINUX_DEFAULT="splash quiet"/GRUB_CMDLINE_LINUX_DEFAULT=""/g /etc/default/grub
sed -i -e s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=0/g /etc/default/grub
sudo update-grub && sudo update-grub2


cp ./xorg.conf /etc/X11/xorg.conf
cp ./bash_profile ~/.bash_profile
cp ./xinitrc ~/.xinitrc
cp ./gitconfig ~/.gitconfig
cp ./fonts.conf ~/.fonts.conf

cp -r ./i3 ~/.config

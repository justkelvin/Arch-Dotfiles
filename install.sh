#!/bin/env bash
set -e

echo "Good to have you back... Lets get started setting you up." && sleep 2
echo "Arch is home." && sleep 4

# does full system update
echo "A system upgrade is needed to get everything running..."
sudo pacman --noconfirm -Syu

sleep 1
clear

echo "###########################################################################"
echo "Getting ready..."
echo "###########################################################################"

sleep 2
# install base-devel if not installed
sudo pacman -S --noconfirm --needed base-devel wget git

# install essential packages if not installed
sudo pacman -S --noconfirm okular unzip zip plasma neofetch htop noto-mono-emoji

# install fonts
mkdir -p ~/.local/share/fonts

cp -r ./fonts/* ~/.local/share/fonts/
fc-cache -f
clear 

# Configuration files
mkdir -p ~/.config/

if [ -d ~/.config/eww ]; then
    echo "Eww configs detected, backing up..."
    mkdir ~/.config/eww.old && mv ~/.config/eww/* ~/.config/eww.old/
    cp -r ./$EWW_DIR/* ~/.config/eww;
else
    echo "Installing eww configs..."
    mkdir ~/.config/eww && cp -r ./$EWW_DIR/* ~/.config/eww;
fi

sleep 5
xmonad --recompile

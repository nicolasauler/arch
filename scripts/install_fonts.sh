#!/bin/bash

DISTRO=$(grep "^ID=.*$" /etc/os-release | awk -F= '{ print $2 }')

if [[ $DISTRO == "ubuntu" ]]; then
    sudo apt-get install wget

    mkdir ~/.fonts/
    cd ~/.fonts/
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/InconsolataGo.tar.xz
    tar -xvf InconsolataGo.tar.xz
    fc-cache -fv
elif [[ $DISTRO == "arch" ]]; then
    sudo pacman -S ttf-inconsolata-go-nerd
elif [[ $DISTRO == "gentoo" ]]; then
    doas emerge -at media-fonts/nerd-fonts # using gentoo-zh overlay
fi

#!/bin/bash

DISTRO=$(grep "^ID=.*$" /etc/os-release | awk -F= '{ print $2 }')

if [[ $DISTRO == "ubuntu" ]]; then
    #sudo apt-get install wget
elif [[ $DISTRO == "arch" ]]; then
    sudo pacman -S xf86-video-intel xorg-server i3-wm i3lock rofi polybar xorg-xinit flameshot
elif [[ $DISTRO == "gentoo" ]]; then
    doas emerge sys-kernel/linux-firmware x11-base/xorg-server
    env-update
    source /etc/profile
    doas emerge x11-apps/xrandr x11-wm/i3 x11-misc/polybar x11-misc/rofi media-gfx/flameshot
fi

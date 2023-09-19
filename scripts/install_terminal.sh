#!/bin/bash

DISTRO=$(grep "^ID=.*$" /etc/os-release | awk -F= '{ print $2 }')

if [[ $DISTRO == "ubuntu" ]]; then
    sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

    if [ -d ~/alacritty ]; then
        cd ~/alacritty
        git remote update 

        UPSTREAM=${1:-'@{u}'}
        LOCAL=$(git rev-parse @)
        REMOTE=$(git rev-parse "$UPSTREAM")
        BASE=$(git merge-base @ "$UPSTREAM")

        if [ $LOCAL = $REMOTE ]; then
            echo "Up-to-date"
        elif [ $LOCAL = $BASE ]; then
            git pull

            cargo build --release
            sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
            sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
            sudo desktop-file-install extra/linux/Alacritty.desktop
            sudo update-desktop-database

            mkdir -p ~/.bash_completion
            cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
            echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
        else
            echo "Diverged"
        fi
    else
        git clone https://github.com/alacritty/alacritty.git
        cd alacritty

        cargo build --release
        sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
        sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
        sudo desktop-file-install extra/linux/Alacritty.desktop
        sudo update-desktop-database

        mkdir -p ~/.bash_completion
        cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
        echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
    fi
elif [[ $DISTRO == "arch" ]]; then
    sudo pacman -S alacritty firefox starship zellij
elif [[ $DISTRO == "gentoo" ]]; then
    doas emerge app-shells/starship x11-terms/alacritty www-client/firefox-bin app-misc/zellij
fi

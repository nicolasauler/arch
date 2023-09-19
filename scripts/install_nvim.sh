#!/bin/bash

# 1. Build prereq
DISTRO=$(grep "^ID=.*$" /etc/os-release | awk -F= '{ print $2 }')

if [[ $DISTRO == "ubuntu" ]]; then
  sudo apt-get install ninja-build gettext cmake unzip curl
  sudo apt-get install ripgrep
elif [[ $DISTRO == "arch" ]]; then
  sudo pacman -S base-devel cmake unzip ninja curl
  sudo pacman -S ripgrep
elif [[ $DISTRO == "gentoo" ]]; then
  doas emerge sys-apps/ripgrep
fi

# 2. Check if neovim exists, also check if needs updating
if [ -d ~/neovim ]; then
  cd ~/neovim || exit
  git remote update 

  UPSTREAM=${1:-'@{u}'}
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse "$UPSTREAM")
  BASE=$(git merge-base @ "$UPSTREAM")

  if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Up-to-date"
  elif [ "$LOCAL" = "$BASE" ]; then
    git pull

    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
  else
    echo "Diverged"
  fi
else
  git clone https://github.com/neovim/neovim
  cd neovim || exit

  echo "cloned"
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
fi


# 3. Get my config
if [ -d ~/arch ]; then
  cd ~/arch || exit
  git remote update 

  UPSTREAM=${1:-'@{u}'}
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse "$UPSTREAM")
  BASE=$(git merge-base @ "$UPSTREAM")

  if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Up-to-date"
  elif [ "$LOCAL" = "$BASE" ]; then
    git pull

    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
  else
    echo "Diverged"
  fi
else
  git clone https://github.com/nicolasauler/arch
fi

# 4. Update dotfiles
if [ -d ~/.config/nvim ]; then
  echo "Manually inspect stuff"
  diff ~/arch/config/nvim ~/.config/nvim
else
  cp -r ~/arch/config/nvim ~/.config/
fi

# 5. Sync Lazy
nvim --headless "+Lazy! sync" +qa

# 6. Sync Mason
echo "Run Mason Update"

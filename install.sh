#!/bin/bash

# vars
helping="usage: ./install.sh [-d distribution | -sh shell]\n"

helping="$helping\n-d\t: Distribution it is installed on:\n\t  Either debian or arch"
helping="$helping\n-sh\t: Shell that is used:\n\t  bash or zsh"

if [[ "$#" -eq 0 ]]; then
  exit 2
fi

# HELP
if [[ "$#" -lt 2 || "$#" -eq 3 || "$#" -ge 5 || ${1} == "help" ]]; then
  echo -e "${helping}"
  exit
fi

distribution=""
sh=""

# Installing 
if [[ "$#" -eq 2 || "$#" -eq 4 ]]; then
  case $1 in
    "-d")
      if [[ "$2" == "debian" || "$2" == "arch" ]]; then
        distribution="$2"
        sh="shell"
      else
        echo -e "Error: either arch or debian!\n"
        exit
      fi
    ;;
  "-sh")
    if [[ "$2" == "bash" || "$2" == "zsh" ]]; then
      sh="$2"
      distribution="arch"
    else
      echo -e "Error: either bash or shell"
      exit
    fi
    ;;
  esac
fi

if [[ "$#" -eq 4 ]]; then
  case $3 in
    "-d")
      if [[ "$4" == "debian" || "$4" == "arch" ]]; then
        distribution="$4"
      else
        echo -e "Error: either arch or debian!\n"
        exit
      fi
    ;;
  "-sh")
    if [[ "$4" == "bash" || "$4" == "zsh" ]]; then
      sh="$4"
    else
      echo -e "Error: either bash or shell"
      exit
    fi
    ;;
  esac
fi

echo -e "$distribution"
echo -e "$sh"
src="$HOME/.${sh}rc"

if [[ ${distribution} == "debian" ]]; then
  echo -e "curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage ... "
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  echo -e "Making Appimage executable and creating DIR in /bin/nvim ..."
  chmod u+x nvim-linux-x86_64.appimage
  mkdir -p /usr/bin/
  echo "moving nvim-linux-x86_64.appimgage to /bin/nvim ..."
  mv nvim-linux-x86_64.appimage /usr/bin/nvim
  
  echo "Installing needed Dependencies..."
  apt install \
      python3 \
      cmake \
      libgtk-3-0t64 \
      libglib2.0-0t64 \
      libwebkit2gtk-4.1-0 \
      libsoup-3.0-0 \
      imagemagick \
      lua5.1 \
      npm \
      fd-find \
      luarocks \
      fzf \
      ripgrep

  echo "Installing luarocks: magick.."
  luarocks install magick
  echo "Installed magick!"
  echo "Installed Dependencies!"

  exit
elif [[ ${distribution} == "arch" ]]; then
  exit
fi

#!/bin/bash

# vars
helping="usage: ./install.sh [-d distribution | -sh shell]\n"

helping="$helping\n-d\t: Distribution it is installed on:\n\t  Either debian or arch"
helping="$helping\n-sh\t: Shell that is used:\n\t  bash or zsh"

if [[ "$#" -eq 0 ]]; then
  exit 2
fi

# HELP
if [[ "$#" -le 5 || "$#" -gt 6 || ${1} == "help" ]]; then
  echo -e "${helping}"
  exit
fi

distribution=""
sh=""
proc=""

# Installing 
if [[ "$#" -eq 6 ]]; then
  for $i in {1..3}; do
      arg1=$((i*2-1))
      arg2=$((i*2))
      case "${!arg1}"  in
        "-d")
          if [[ "${!arg2}" == "debian" || "${!arg2}" == "arch" ]]; then
            distribution="${!arg2}"
          else
            echo -e "Error: either arch or debian!\n"
            exit
          fi
        ;;
      "-sh")
        if [[ "${!arg2}" == "bash" || "${!arg2}" == "zsh" ]]; then
          sh="${!arg}"
        else
          echo -e "Error: either bash or shell"
          exit
        fi
        ;;
      "-pr")
        if  [[ "${!arg2}" == "arm64" || "${!arg2}" == "x86-64" ]]; then
          proc="${!arg2}"
        else
          echo -e "Error either arm64 or x86-64"
          exit
        fi
        ;;
      esac
  done
else
  echo -e "Please use 6 Args!"
  exit
fi


src="$HOME/.${sh}rc"

if [[ ${distribution} == "debian" ]]; then
  
  if [[ ${proc} == "x86-64" ]]; then
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
  else
  echo -e "curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.appimage ... "
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.appimage
  echo -e "Making Appimage executable and creating DIR in /bin/nvim ..."
  sudo chmod u+x nvim-linux-arm64.appimage
  sudo mkdir -p /usr/bin/
  echo "moving nvim-linux-arm64.appimgage to /bin/nvim ..."
  sudo mv nvim-linux-arm64.appimage /usr/bin/nvim
  
  sudo apt install \
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
  fi
  echo "Installing luarocks: magick.."
  luarocks install magick
  echo "Installed magick!"
  echo "Installed Dependencies!"

  exit
elif [[ ${distribution} == "arch" ]]; then
  sudo pacman -Sy nvim
  exit
fi

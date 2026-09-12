# This is SQUA's nvim configuration.

## Installing latest Nvim (x86_64) release AppImage:
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```
In ~/.bashrc or ~/.zshrc add following:
```
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```
then applying changes through terminal:
```
source ~/.bashrc
```
or
```
source ~/.zshrc
```
### Arch Linux:
```
sudo pacman -S --needed \
    python3 \
    cmake \
    go \
    gtk3 \
    glib2 \
    webkit2gtk-4.1 \
    libsoup3 \
    imagemagick \
    lua51 \
    npm \
    fd \
    luarocks \
    fzf \
    ripgrep

luarocks install magick
```

### Debian:
```
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

luarocks install --local magick
```

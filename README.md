# This is SQUA's nvim configuration.

## Installing
### PreInstall
Arch:
```
sudo pacman -S nvim
```
Debian
```
sudo apt install nvim
```

### Installation Script
```
./install.sh -d <distribution> -sh <shell>
```

### PostInstallation
In terminal:
```
nvim
```
there type in
`
: Mason
`
and let it Install the required lsp from Mason.


## Dependencies
### Arch:
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

# This is SQUA's nvim configuration.

## Arch Linux:
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

## Debian:
```
sudo apt install \
    python3 \
    cmake \
    libgtk3.0-0t64 \
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

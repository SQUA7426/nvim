# This is SQUA's nvim configuration.

## Installing

```
./install.sh -d <distribution> -sh <shell>
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

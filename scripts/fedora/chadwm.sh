#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_PATH="$SCRIPT_DIR/../../../../themes/dwm/chadwm"

echo "Installing DWM (chadwm) on Fedora"

sudo dnf install -y dwm dmenu st picom rofi feh nitrogen

mkdir -p "$HOME/.config/dwm"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/eww"
mkdir -p "$HOME/.local/share/fonts"

if [ -d "$THEME_PATH/config" ]; then
    cp -r "$THEME_PATH/config"/* "$HOME/.config/dwm/"
fi

if [ -d "$THEME_PATH/rofi" ]; then
    cp -r "$THEME_PATH/rofi"/* "$HOME/.config/rofi/"
fi

if [ -d "$THEME_PATH/eww" ]; then
    cp -r "$THEME_PATH/eww"/* "$HOME/.config/eww/"
fi

if [ -d "$THEME_PATH/wallpapers" ]; then
    cp -r "$THEME_PATH/wallpapers" "$HOME/.config/" 2>/dev/null || true
fi

if ! grep -q "exec dwm" "$HOME/.xinitrc" 2>/dev/null; then
    echo "exec dwm" >> "$HOME/.xinitrc"
fi

echo "DWM chadwm theme installed!"

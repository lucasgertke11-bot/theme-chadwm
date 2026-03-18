#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_PATH="$SCRIPT_DIR/../../../../themes/dwm/chadwm"

echo "Installing DWM (chadwm) on OpenSUSE"

sudo zypper install -y dwm dmenu st picom rofi feh nitrogen

mkdir -p "$HOME/.config/dwm"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/eww"

if [ -d "$THEME_PATH/config" ]; then
    cp -r "$THEME_PATH/config"/* "$HOME/.config/dwm/"
fi

if [ -d "$THEME_PATH/wallpapers" ]; then
    cp -r "$THEME_PATH/wallpapers" "$HOME/.config/" 2>/dev/null || true
fi

if ! grep -q "exec dwm" "$HOME/.xinitrc" 2>/dev/null; then
    echo "exec dwm" >> "$HOME/.xinitrc"
fi

echo "DWM chadwm theme installed!"

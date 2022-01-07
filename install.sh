#!/usr/bin/bash
cd $(dirname "$0")

ln -sf $(pwd)/zshrc.zsh ../.zshrc

mkdir -p ../.xmonad
ln -sf $(pwd)/xmonad.hs ../.xmonad/xmonad.hs

ln -sf $(pwd)/xmobarrc  ../.xmobarrc

mkdir -p ../.config/rofi
ln -sf $(pwd)/rofiConfig.rasi ../.config/rofi/config.rasi
ln -sf $(pwd)/rofiTheme.rasi ../.config/rofi/dranoelsTheme.rasi

ln -sf $(pwd)/alacritty.yml ../.alacritty.yml

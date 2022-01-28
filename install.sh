#!/usr/bin/bash
cd $(dirname "$0")

ln -sf $(pwd)/zshrc ../.zshrc
ln -sf $(pwd)/stalonetrayrc ../.stalonetrayrc

mkdir -p ../.xmonad
ln -sf $(pwd)/xmonad.hs ../.xmonad/xmonad.hs

ln -sf $(pwd)/xmobarrc  ../.xmobarrc

mkdir -p ../.config/rofi
ln -sf $(pwd)/rofiConfig.rasi ../.config/rofi/config.rasi
ln -sf $(pwd)/rofi/theme/config2.rasi ../.config/rofi/draculaTheme.rasi

ln -sf $(pwd)/alacritty.yml ../.alacritty.yml

mkdir -p ../.config/picom
ln -sf $(pwd)/picom.conf ../.config/picom/picom.conf

mkdir -p ../.config/dunst
ln -sf $(pwd)/dunst/dunstrc ../.config/dunst/dunstrc


#!/usr/bin/bash

# Themes

mkdir -p ~/.vim/pack/themes/start
ln -sf $(pwd)/vim ~/.vim/pack/themes/start/dracula

mkdir -p ~/.themes
ln -sf $(pwd)/gtk ~/.themes/dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

echo "Make sure to change the grub theme to \"$(pwd)/grub/themes/dracula\""

mkdir -p ~/.config/qt5ct/colors
ln -sf $(pwd)/qt5/Dracula.conf ~/.config/qt5ct/colors/Dracula.conf
echo "Make sure to change the qt5ct theme to \"Dracula\""

# Config Files
cd $(dirname "$0")

ln -sf $(pwd)/zshrc ~/.zshrc

mkdir -p ~/.xmonad
ln -sf $(pwd)/xmonad.hs ~/.xmonad/xmonad.hs

ln -sf $(pwd)/xmobar.hs ~/.xmobar.hs

mkdir -p ~/.config/rofi
ln -sf $(pwd)/rofiConfig.rasi ~/.config/rofi/config.rasi
ln -sf $(pwd)/rofi/theme/config1.rasi ~/.config/rofi/draculaTheme.rasi

ln -sf $(pwd)/alacritty.yml ~/.alacritty.yml

mkdir -p ~/.config/picom
ln -sf $(pwd)/picom.conf ~/.config/picom/picom.conf

mkdir -p ~/.config/dunst
ln -sf $(pwd)/dunst/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.vim
ln -sf $(pwd)/vimrc ~/.vimrc

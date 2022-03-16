#!/usr/bin/bash

# Themes

echo "Make sure to change the grub theme to \"$(pwd)/grub/dracula/theme.txt\""

mkdir -p ~/.config/qt5ct/colors
ln -sf $(pwd)/qt5/Dracula.conf ~/.config/qt5ct/colors/Dracula.conf
ln -sf $(pwd)/qt5ct.conf ~/.config/qt5ct/qt5ct.conf

mkdir -p ~/.config/gtk-3.0
ln -sf $(pwd)/gtk3settings.ini ~/.config/gtk-3.0/settings.ini
ln -sf $(pwd)/gtkrc-2.0 ~/.gtkrc-2.0

ln -sf $(pwd)/xresources/Xresources ~/.Xresources

mkdir -p ~/.config/ranger/colorschemes
ln -sf $(pwd)/ranger/dracula.py ~/.config/ranger/colorschemes/dracula.py

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

mkdir -p ~/.config/nvim/autoload
ln -sf $(pwd)/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/vim-plug/plug.vim ~/.config/nvim/autoload/plug.vim

mkdir -p ~/.config/ranger
ln -sf $(pwd)/rc.conf ~/.config/ranger/rc.conf
ln -sf $(pwd)/rifle.conf ~/.config/ranger/rifle.conf

mkdir -p ~/.config/i3
ln -sf $(pwd)/i3 ~/.config/i3/config

ln -sf $(pwd)/xinitrc ~/.xinitrc

ln -sf $(pwd)/mimeapps.list ~/.config/mimeapps.list

mkdir -p ~/.config/polybar
ln -sf $(pwd)/polybar.ini ~/.config/polybar/config.ini

#!/usr/bin/bash

# Themes

echo "Make sure to change the grub theme to \"$(pwd)/grub/theme.txt\""

mkdir -p ~/.config/qt5ct/colors
ln -sf $(pwd)/qt5ct/qt5ct-colours.conf ~/.config/qt5ct/colors/Dracula.conf
ln -sf $(pwd)/qt5ct/qt5ct.conf ~/.config/qt5ct/qt5ct.conf

mkdir -p ~/.themes
if ! [ -d ~/.themes/Dracula ]
then
  ln -sf $(pwd)/gtk ~/.themes/Dracula
fi

mkdir -p ~/.config/gtk-3.0
ln -sf $(pwd)/gtk3.ini ~/.config/gtk-3.0/settings.ini
ln -sf $(pwd)/gtkrc-2.0 ~/.gtkrc-2.0

ln -sf $(pwd)/Xresources ~/.Xresources

mkdir -p ~/.config/ranger/colorschemes
ln -sf $(pwd)/ranger.py ~/.config/ranger/colorschemes/dracula.py

# Config Files

cd $(dirname "$0")

ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/zprofile ~/.zprofile

mkdir -p ~/.xmonad
ln -sf $(pwd)/xmonad.hs ~/.xmonad/xmonad.hs

ln -sf $(pwd)/xmobar.hs ~/.xmobar.hs

mkdir -p ~/.config/rofi
ln -sf $(pwd)/rofi-config.rasi ~/.config/rofi/config.rasi
ln -sf $(pwd)/rofi-theme.rasi ~/.config/rofi/dracula-theme.rasi

ln -sf $(pwd)/alacritty.yml ~/.alacritty.yml

mkdir -p ~/.config/picom
ln -sf $(pwd)/picom.conf ~/.config/picom/picom.conf

mkdir -p ~/.config/dunst
ln -sf $(pwd)/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/nvim/autoload
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim
ln -sf $(pwd)/plug.vim ~/.config/nvim/autoload/plug.vim

mkdir -p ~/.config/ranger
ln -sf $(pwd)/rc.conf ~/.config/ranger/rc.conf
ln -sf $(pwd)/rifle.conf ~/.config/ranger/rifle.conf

mkdir -p ~/.config/i3
ln -sf $(pwd)/i3 ~/.config/i3/config

ln -sf $(pwd)/xinitrc ~/.xinitrc

ln -sf $(pwd)/mimeapps.list ~/.config/mimeapps.list

mkdir -p ~/.config/polybar
ln -sf $(pwd)/polybar.ini ~/.config/polybar/config.ini

mkdir -p ~/.config/sxhkd
ln -sf $(pwd)/sxhkdrc ~/.config/sxhkd/sxhkdrc

mkdir -p ~/.config/bspwm
ln -sf $(pwd)/bspwmrc ~/.config/bspwm/bspwmrc

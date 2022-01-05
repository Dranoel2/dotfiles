#!/usr/bin/bash
cd $(dirname "$0")

ln -sf $(pwd)/zshrc.zsh ../.zshrc
ln -sf $(pwd)/xmonad.hs ../.xmonad/xmonad.hs
ln -sf $(pwd)/xmobarrc  ../.xmobarrc

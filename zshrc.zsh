#!/usr/bin/zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/leonard/.zshrc'
autoload -Uz compinit
compinit

source /usr/share/nvm/init-nvm.sh

PS1='%F{cyan}%2~ %F{yellow}%#> %f'
export PATH=~/.local/bin:$PATH

alias update="pac-update"
alias pac="sudo pacman --assume-installed nodejs --assume-installed npm"
alias pac-install="pac -S "
alias pac-update="pac -Syu"
alias pac-remove="pac -R"
alias aur="yay --assume-installed nodejs --assume-installed npm"
alias aur-install="aur -S"

neofetch

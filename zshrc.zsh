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
export PATH="$(yarn global bin):~/.local/bin:$PATH"

alias pac="yay --assume-installed nodejs --assume-installed npm --assume-installed sudo --nodiffmenu --removemake"
alias reload="source ~/.zshrc"

neofetch

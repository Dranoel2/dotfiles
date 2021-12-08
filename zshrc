HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/leonard/.zshrc'

source ~/.dotfiles/zsh-autocomplete/zsh-autocomplete.plugin.zsh

PS1="%F{cyan}%2~ %F{yellow}%#> %f"

alias update="sudo -- sh -c 'pacman -Syu'"

neofetch

export LANG=en_GB.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/leonard/.zshrc'
autoload -Uz compinit
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
compinit

precmd() {
  vcs_info
}

zstyle ':vcs_info:git:*' formats '%K{yellow}%F{black}  %b %F{yellow}'

source /usr/share/nvm/init-nvm.sh

setopt prompt_subst
PROMPT='%(?..%F{red} %? %F{blue})%K{blue}%F{black}  %2~ %F{blue}${vcs_info_msg_0_}%k %f'

export PATH="$(yarn global bin):$PATH"

alias pac="yay --assume-installed nodejs=16.13.2 --assume-installed npm=8.1.2 --nodiffmenu --removemake"
alias reload="source ~/.zshrc"

neofetch

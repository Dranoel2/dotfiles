eval $(keychain --eval id_ed25519 -q)
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

source ~/.dotfiles/dracula-tty.sh

export LANG=en_GB.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
compinit

precmd() {
  vcs_info
}

eval $(thefuck --alias)

zstyle ':vcs_info:git:*' formats '  %b '

setopt prompt_subst
PROMPT='%(?..%F{red} %? %F{blue})%K{blue}%F{black}  %2~ %F{blue}%K{yellow}%F{black}${vcs_info_msg_0_}%F{yellow}%k %f'

alias pac="yay --answerclean None --nodiffmenu --removemake --assume-installed xdg-utils"
alias reload="source ~/.zshrc"
alias ll="ls -la"

if [ ! -f /tmp/openedShell ]; then
	touch /tmp/openedShell
	neofetch
fi

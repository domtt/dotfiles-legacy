# If you come from bash you might have to change your $PATH. export 
# PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git docker httpie python rust npm golang fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions if [[ -n 
# $SSH_CONNECTION ]]; then
#   export EDITOR='vim' else
#   export EDITOR='mvim'
# fi

alias e="nvim"
alias ezsh="e ~/.zshrc; source ~/.zshrc"
alias envim="e ~/.config/nvim/init.vim"
alias ealacritty="e ~/.config/alacritty/alacritty.yml"

alias i="sudo apt install -y"
alias update="sudo apt update; sudo apt upgrade"
alias k="sudo kill"
alias pk="sudo pkill"

alias c="clear"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

clone () {
  git clone https://github.com/$1
}

clonemy() {
  git clone https://github.com/d0minikt/$1
}

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias tmux="TERM=screen-256color-bce tmux -2"

export PATH=$PATH:$HOME

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.linuxbrew/bin:$PATH"

export ZSH=/home/mockra/.oh-my-zsh

ZSH_THEME="cloud"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias g='git'
alias gd='g diff'
alias gA="g add -A"
alias gc="g commit -v"
alias gp="g push"
alias gup='g pull --rebase'
alias gst='g status'
alias gpu='g push -u origin HEAD'
alias v='vim'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

eval "$(rbenv init -)"

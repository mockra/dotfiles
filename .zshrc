export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VISUAL=nvim
export EDITOR="$VISUAL"

# Setup git alias commands
alias g='git'
alias ga="g add"
alias gd='g diff'
alias gc="g commit -v"
alias gp="g push"
alias gup='g pull --rebase'
alias gst='g status'
alias gpu='g push -u origin HEAD'
alias gra='g reset --hard'

alias v='nvim'
alias m='make'

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

# Tmux
alias t="tmux"
alias tn="t new -t"
alias ta="t attach -t"

if test -e ~/.env
then
  source ~/.env
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

if which rbenv >/dev/null; then
  eval "$(rbenv init - zsh)"
fi

if which nodenv >/dev/null; then
  eval "$(nodenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

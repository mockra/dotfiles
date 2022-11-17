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

alias v='nvim'

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

if [ -n "${CODESPACES}" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if which rbvenv >/dev/null; then
  eval "$(rbenv init -)"
fi

if [[ $GITHUB_REPOSITORY == "github/github" ]]; then
  export PATH=$(/workspaces/github/bin/npm bin -g):$PATH
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

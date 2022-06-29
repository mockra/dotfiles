[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

alias ls='exa'

# Tmux
alias t="tmux"
alias tn="t new -t"
alias ta="t attach -t"

if test -e ~/.env
  source ~/.env
end
export PATH="$HOME/.rbenv/bin:$PATH"

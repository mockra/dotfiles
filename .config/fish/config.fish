set -gx OMF_PATH $HOME/.local/share/omf

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

. ~/.shenv

set -gx PATH $HOME/.rbenv/shims /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH
set -x NODE_PATH /usr/local/lib/node_modules

rbenv rehash >/dev/null ^&1

set -gx OMF_PATH $HOME/.local/share/omf
source $OMF_PATH/init.fish

set -g fish_greeting ''

function fish_title
  git rev-parse --abbrev-ref HEAD
end
funcsave fish_title

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

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
test -s {$HOME}/.kiex/scripts/kiex.fish ; and source {$HOME}/.kiex/scripts/kiex.fish

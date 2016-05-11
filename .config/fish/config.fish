set -g OMF_PATH $HOME/.local/share/omf
set -g OMF_CONFIG $HOME/.config/omf
source $OMF_PATH/init.fish

set -g fish_greeting ''
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins rbenv bundler node rails brew localhost gi

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

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

alias v='nvim'

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

. ~/.shenv

set -x GOPATH $HOME/dev/go
set -gx PATH $HOME/.rbenv/shims $AWS_ELB_HOME/bin $EC2_HOME/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/X11/bin $GOPATH/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x ANDROID_HOME=/usr/local/opt/android-sdk

rbenv rehash >/dev/null ^&1

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

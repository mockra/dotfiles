# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

alias ls='exa'

# Tmux
alias t="tmux"
alias tn="t new -t"
alias ta="t attach -t"

if test -e ~/.env
then
  source ~/.env
fi

export PATH="$HOME/.rbenv/bin:$PATH"

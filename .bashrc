alias g='git'
alias gst='g status'
alias gd='g diff'
alias v='vim'
alias be='bundle exec'
alias gA="g add -A"
alias ga="g add"
alias gc="g commit -v"
alias gp="g push"
alias gb="g branch"
alias gup='git pull --rebase'
alias bi='bundle install'

source ~/.shenv
source ~/.bash_theme

HISTSIZE=50000

export GOPATH=$HOME/dev/go
export PATH=$AWS_ELB_HOME/bin:$EC2_HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$GOPATH/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cloud"
DEFAULT_USER='mockra'

plugins=(git bundler brew gem osx rails3 thor lein)

source $ZSH/oh-my-zsh.sh
alias todo='todo.sh'

test -r ~/.shenv && . ~/.shenv

export GOPATH=/Users/mockra/dev/go
export PATH=/Users/mockra/.rbenv/shims:${AWS_ELB_HOME}/bin:$EC2_HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$GOPATH/bin

export NODE_PATH=/usr/local/lib/node_modules
eval "$(rbenv init -)"

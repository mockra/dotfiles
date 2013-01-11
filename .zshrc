ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DEFAULT_USER='mockra'

plugins=(git bundler brew gem osx rails3 thor)

source $ZSH/oh-my-zsh.sh

test -r ~/.shenv && . ~/.shenv

export PATH=/Users/mockra/.rbenv/shims:${AWS_ELB_HOME}/bin:$EC2_HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

alias byword='open -a Byword'

export NODE_PATH=/usr/local/lib/node_modules
eval "$(rbenv init -)"

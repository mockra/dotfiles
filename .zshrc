# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mockra/.oh-my-zsh"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

ZSH_THEME="robbyrussell"
plugins=(git)
zplug "dracula/zsh", as:theme
source $ZSH/oh-my-zsh.sh

alias v="vim"
export EDITOR="vim"

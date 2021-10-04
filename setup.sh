#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get --assume-yes install silversearcher-ag fish tmux neovim exa

## Link Dotfiles
mkdir $HOME/.config/nvim
mkdir $HOME/.config/fish

ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.tmux-status.conf $HOME/.tmux-status.conf

ln -s $(pwd)/.config/nvim/* $HOME/.config/nvim/
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.gitconfig $HOME/.gitconfig

rm -f $HOME/.zshrc
ln -s $(pwd)/.config/fish/* $HOME/.config/fish/

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless +PlugInstall +qa

# Set default shell
sudo chsh -s "$(which fish)" "$(whoami)"

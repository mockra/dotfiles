#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update -y
sudo apt-get --assume-yes install silversearcher-ag fish tmux neovim exa

## Link Dotfiles
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/fish

ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux-status.conf $HOME/.tmux-status.conf

ln -sf $(pwd)/.config/nvim/* $HOME/.config/nvim/
ln -sf $(pwd)/.vimrc $HOME/.vimrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig

rm -f $HOME/.zshrc

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless +PlugInstall +qa

# Set default shell
ln -sf $PWD/.config/fish/* $HOME/.config/fish/
ln -sf $PWD/.config/fish/functions/* $HOME/.config/fish/functions/
ln -sf $PWD/.config/fish/completions/* $HOME/.config/fish/completions/
ln -sf $PWD/.config/fish/conf.d/* $HOME/.config/fish/conf.d/

sudo chsh -s "$(which fish)" "$(whoami)"

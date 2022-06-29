#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-get update -y
sudo apt-get --assume-yes install silversearcher-ag tmux neovim exa

rm -rf $HOME/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

## Link Dotfiles
mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/.bashrc $HOME/.bashrc

ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux-status.conf $HOME/.tmux-status.conf

ln -sf $(pwd)/.config/nvim/* $HOME/.config/nvim/
ln -sf $(pwd)/.vimrc $HOME/.vimrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig

rm -f $HOME/.zshrc
ln -sf $(pwd)/.zshrc $HOME/.zshrc

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless +PlugInstall +qa

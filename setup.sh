#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-3
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

sudo chsh -s "$(which fish)" "$(whoami)"

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless +PlugInstall +qa

# Set default shell
ln -s $(pwd)/.config/fish/* $HOME/.config/fish/
source $HOME/.config/fish/config.fish

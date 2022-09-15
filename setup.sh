#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-get update -y
sudo apt-get --assume-yes install silversearcher-ag fuse

# Install neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
wget https://github.com/github/copilot.vim/releases/download/neovim-nightlies/appimage.zip
unzip appimage.zip
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
mv tmux.appimage /usr/local/bin/tmux

rm -f $HOME/.zshrc
ln -sf $(pwd)/.zshrc $HOME/.zshrc

rm -rf $HOME/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

## Link Dotfiles
mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf

ln -sf $(pwd)/.config/nvim/* $HOME/.config/nvim/
ln -sf $(pwd)/.vimrc $HOME/.vimrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless +PlugInstall +qa

sudo chsh -s "$(which zsh)" "$(whoami)"

#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install Packages
sudo apt-get update -y
sudo apt-get --assume-yes install silversearcher-ag fuse ripgrep universal-ctags

# Install neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
wget https://github.com/neovim/neovim-releases/releases/download/v0.11.4/nvim-linux-x86_64.appimage
sudo chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# Install tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux

rm -f $HOME/.zshrc
ln -sf $(pwd)/.zshrc $HOME/.zshrc

rm -rf $HOME/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

# Install nodenv
git clone https://github.com/nodenv/node-build.git /usr/local/.nodenv/plugins/node-build
nodenv install 16.0.0
nodenv global 16.0.0

## Link Dotfiles
mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf

ln -sf $(pwd)/.vsnip/* $HOME/.vsnip/
ln -sf $(pwd)/.config/nvim/* $HOME/.config/nvim/
ln -sf $(pwd)/.vimrc $HOME/.vimrc
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.agignore $HOME/.agignore
ln -sf $(pwd)/.ignore $HOME/.ignore

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
nvim --headless "+Lazy! sync" +qa

sudo chsh -s "$(which zsh)" "$(whoami)"

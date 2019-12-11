#!/bin/bash

path () {
	export PATH="$PATH:$1"
	echo "export PATH=\"\$PATH:$1\"" >> ~/.profile
}

# Essentials
sudo apt install -y git curl software-properties-common apt-transport-https wget gnome-tweak-tool

# General
# General > Chrome
sudo apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome*.deb

# Code Editors
# Code Editors > VsCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update -y
sudo apt install code -y
# Code Editors > NeoVim
sudo apt install -y neovim

# Note Taking
# Note taking > TexLive
sudo apt install -y texlive-full
# Note taking > Pandoc
sudo apt install -y pandoc

# Languages
# Languages > Python
sudo apt install -y python3 python3-pip
# Languages > Node.js
sudo apt install -y npm nodejs
# Languages > Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup component add rls rust-analysis rust-src
# Languages > Dart/Flutter
wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.6-stable.tar.xz
tar xf ./flutter_linux*.tar.xz
export PATH=$PATH:$HOME/flutter/bin
path "$HOME/flutter/bin"
# Languages > Go
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-go


# Install neovim vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Post Installation


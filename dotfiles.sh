#!/bin/bash

git clone --bare https://github.com/d0minikt/dotfiles $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout

bash ./install.sh

#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles repo
git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Symlink dotfiles
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# prep vim
mkdir -p ~/.vim/{swaps,backups,undo}
ln -sfv "$DOTFILES_DIR/vim/colors" ~/.vim/colors

# Install packages
. "$DOTFILES_DIR/install/brew.sh"

# Add homebrew bash 4 as valid shell
grep -q -F "/usr/local/bin/bash" /etc/shells || echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

# Set user shell
chsh -s /usr/local/bin/bash

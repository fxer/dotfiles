#!/usr/bin/env bash
# script runs via bash, because it's prob the only shell available on a fresh macOS install

# Get this script's absolute path, in case this script is invoked from a different path
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )"

# Update dotfiles repo
git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Symlink dotfiles
ln -sfv "$DOTFILES_DIR/.profile" ~
ln -sfv "$DOTFILES_DIR/.profile_secrets" ~
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.bash_completion" ~
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.inputrc" ~
ln -sfv "$DOTFILES_DIR/.psqlrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# prep atom
mkdir -p ~/.atom
ln -sfv $DOTFILES_DIR/atom/* ~/.atom/

# prep vim
mkdir -p ~/.vim/{swaps,backups,undo}
ln -snfv "$DOTFILES_DIR/vim/colors" ~/.vim/colors

# install common packages
. "$DOTFILES_DIR/install/common.sh"
. "$DOTFILES_DIR/install/python.sh"

# Install zsh
. "$DOTFILES_DIR/install/zsh.sh"

# Install Bash
# . "$DOTFILES_DIR/install/bash.sh"

# Customize macOS itself
. "$DOTFILES_DIR/macos/defaults.sh"

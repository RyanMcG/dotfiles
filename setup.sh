#!/bin/bash

DOTFILES=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


ln -s $DOTFILES/.bash_aliases ~/
ln -s $DOTFILES/.bash_profile ~/
ln -s $DOTFILES/.bashrc ~/
ln -s $DOTFILES/.ctags ~/
ln -s $DOTFILES/.fonts ~/
ln -s $DOTFILES/.general_aliases ~/
ln -s $DOTFILES/.general_aliases_extra ~/
ln -s $DOTFILES/.general_rc ~/
ln -s $DOTFILES/.gitconfig ~/
ln -s $DOTFILES/.gitignore.global ~/
ln -s $DOTFILES/.mpd ~/
ln -s $DOTFILES/.profile ~/
ln -s $DOTFILES/.tmux.conf ~/
ln -s $DOTFILES/.vim ~/
ln -s $DOTFILES/.vimrc ~/
ln -s $DOTFILES/.zshrc ~/
ln -s $DOTFILES/.ackrc ~/
ln -s $DOTFILES/.oh-my-zsh ~/
ln -s $DOTFILES/.ncmpcpp ~/

mkdir -p ~/bin
ln -s $DOTFILES/bin/git-gcbranches ~/bin/

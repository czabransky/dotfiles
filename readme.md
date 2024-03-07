---
id: readme
aliases: []
tags: []
---

# Dotfiles

This repository maintains my personal configurations for standard tools:
 - Vim
 - NeoVim
 - IdeaVim

## Installation

### Using Stow


[Create symbolic links using Stow](https://www.gnu.org/software/stow/)
```sh
git clone https://github.com/czabransky/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -v --dotfiles .
```

### Manual

```sh
git clone https://github.com/czabransky/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/dot-zshrc ~/.zshrc
ln -s ~/dotfiles/dot-vimrc ~/.vimrc
ln -s ~/dotfiles/dot-ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/dot-config ~/.config

```

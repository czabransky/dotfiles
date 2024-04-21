---
id: readme
aliases: []
tags: []
---

# dotfiles

This repository maintains my personal configurations for standard tools:
 - Vim
 - NeoVim
 - IdeaVim

**Note: Keybinds are configured for [this layout.](https://configure.zsa.io/voyager/layouts/Qle9V/Wmoon/0)**  

## Installation

### Prerequisites
- any nerdfont
- ripgrep
- python


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

## Useful Tools
These tools are not required for vim/neovim, but they make for a much better terminal experience!
- terminal theme (e.g., catppuccin for windows terminal / wsl)
- tmux
- fzf
- eza





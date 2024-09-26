---
id: readme
aliases: []
tags: []
---

# dotfiles

This repository maintains my personal configurations for:
 - Vim
 - NeoVim
 - IdeaVim

**Note: Keybinds are configured for [this layout.](https://configure.zsa.io/voyager/layouts/Qle9V/Wmoon/0)**  

## Installation

### Prerequisites
- any nerdfont
- ripgrep
- fzf
- python

#### CSharp
- [dotnet](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks?cid=getdotnetsdk)
- [netcoredbg](https://github.com/Samsung/netcoredbg)

### Using Stow


[Create symbolic links using Stow](https://www.gnu.org/software/stow/)
```sh
git clone https://github.com/czabransky/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -v .
```

### Manual

```sh
git clone https://github.com/czabransky/dotfiles.git ~/dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux ~/.tmux
ln -sf ~/dotfiles/.config ~/.config
```

## Useful Tools
These tools are not required for vim/neovim, but they make for a much better terminal experience!
- terminal theme (e.g., catppuccin for windows terminal / wsl)
- fd
- bat
- eza
- tmux
- lazygit
- direnv
- direnvx (for secrets)


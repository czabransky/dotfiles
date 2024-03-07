#!/bin/bash

# configure wsl.conf 
CURRENT_USER=$USER
sudo /bin/bash -c 'printf "[user]\ndefault=%s\n" $CURRENT_USER >> /etc/wsl.conf'
sudo /bin/bash -c 'printf "[boot]\nsystemd=true\n" >> /etc/wsl.conf'

# upgrade distribution
sudo apt -y upgrade --fix-missing
sudo apt -y full-upgrade

# install xapps
sudo apt -y install x11-apps

# brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt -y install build-essential
NONINTERACTIVE=1 /home/linuxbrew/.linuxbrew/bin/brew install gcc

# tmux 
NONINTERACTIVE=1 /home/linuxbrew/.linuxbrew/bin/brew install tmux

# python
NONINTERACTIVE=1 /home/linuxbrew/.linuxbrew/bin/brew install python3
python3 -m pip install --upgrade pip

# zsh
NONINTERACTIVE=1 /home/linuxbrew/.linuxbrew/bin/brew install zsh
sudo sh -c 'printf "%s\n" /home/linuxbrew/.linuxbrew/bin/ >> /etc/shells'
sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/zsh shellenv)"
/bin/bash/ -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
(echo; echo 'source ~/.zshrc.pre-oh-my-zsh') >> $HOME/.zshrc
omz theme set cloud

# install zoxide and fuzzy finder for zoxide interactive
brew install zoxide
eval "$(zoxide init zsh)"
brew install fzf


# SDK Man
curl -s 'https://get.sdkman.io' | bash
source '$HOME/.sdkman/bin/sdkman-init.sh'
sdk install java 21.0.2-amzn

# configure wsl-open
# https://gitlab.com/4U6U57/wsl-open
mkdir ~/bin
echo '[[ -e ~/bin ]] && export PATH=$PATH:~/bin' >> ~/.zshrc
curl -o ~/bin/wsl-open https://raw.githubusercontent.com/4U6U57/wsl-open/master/wsl-open.sh

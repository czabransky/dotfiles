export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export EDITOR='nvim'
export VISUAL='nvim'

# keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history
HISTSIZE=5000
HISTFIRLE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# shell settings
IGNOREEOF=10   # shell only exists after the 10th consecutive ctrl-d
setopt ignoreeof # should work for zsh, same as IGNOREEOF=10

# aliases
alias c='clear'
alias n='nvim'
alias lg='lazygit'

# Homebrew Config
export PATH=/home/linuxbrew/.linuxbrew/Homebrew/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ZSH Config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud-mini" # set by `omz`
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(
    git
    zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# zoxide config
eval "$(zoxide init zsh)"

# bat (better cat)
export BAT_THEME="Catppuccin Frappe"

# configure eza
alias l="eza --color=always --long --all --git --icons=always --no-time"
alias etree="eza --tree --level=2 --all --git --icons=always --color=always"

# set up fzf keybindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=1 --all --git --icons=always --color=always {} | head -200'"

bindkey -s '^e' 'nvim $(fzf)\n'

_fzf_comprun() {
	local command=$1
	shift
	case "$command" in
		cd)				fzf --preview 'eza --tree --level=1 --color=always {} | head -200' "$@" ;;
		z)				fzf --preview 'eza --tree --level=1 --color=always {} | head -200' "$@" ;;
		export|unset)	fzf --preview "eval 'echo $' {}" "$@" ;;
		echo)			fzf --preview "eval 'echo $' {}" "$@" ;;
		ssh)			fzf --preview "dig {}" "$@" ;;
		*)				fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
	esac
}

# Python Config
# export PYTHONPATH="${PYTHONPATH}:/home/colin/.local/lib/python3.8/site-packages"
# export PYTHONPATH="${PYTHONPATH}:/usr/lib/python3/dist-packages"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

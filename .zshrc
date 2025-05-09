# ZSH Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="duellj"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Path Configuration
export PATH="$HOME/.local/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/home/$USER/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/$USER/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# FZF Configuration
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
eval "$(fzf --zsh)"
_fzf_compgen_path() { fd --hidden --exclude .git . "$1" }
_fzf_compgen_dir() { fd --type=d --hidden --exclude .git . "$1" }

# Aliases
alias ls="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias open="xdg-open"
alias cd="z"
alias fetch="fastfetch"
alias vim="nvim"
alias py="python"

# Tools Initialization
eval "$(zoxide init zsh)"  # Smarter directory navigation
eval "$(thefuck --alias)"  # Command correction
[ -s "/home/$USER/.bun/_bun" ] && source "/home/$USER/.bun/_bun"  # Bun shell completions
source <(ng completion script)  # Angular CLI autocompletion
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"  # Homebrew initialization

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm bash_completion

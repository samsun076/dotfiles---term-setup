# ~/.zshrc
# Minimal zsh configuration

# ----- Basic Configuration -----
export LANG=en_US.UTF-8
export EDITOR='vim'

# ----- Starship Prompt -----
eval "$(starship init zsh)"

# ----- History Configuration -----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# ----- Aliases -----
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# ----- Homebrew -----
eval "$(/opt/homebrew/bin/brew shellenv)"

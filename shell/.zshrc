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
alias ls='lsd'
alias ll='lsd -lrth --group-dirs first'
alias la='lsd -A --group-dirs first'
alias l='lsd -CF'
alias md='glow'  # Pretty markdown viewer

# ----- Homebrew -----
eval "$(/opt/homebrew/bin/brew shellenv)"

# ----- PATH additions -----
source ~/.config/envman/PATH.env
export PATH=~/.npm-global/bin:$PATH

# ----- pyenv -----
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ----- envman -----
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Added by Antigravity
export PATH="/Users/dm/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

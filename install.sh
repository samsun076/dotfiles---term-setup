#!/bin/bash
# Dotfiles install script for macOS

set -e

echo "Installing dotfiles..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install dependencies
echo "Installing dependencies..."
brew install starship stow glow lsd

# Install font (optional but recommended)
echo "Installing JetBrains Mono Nerd Font..."
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || echo "Font already installed"

# Install Ghostty (optional)
echo "Installing Ghostty..."
brew install --cask ghostty 2>/dev/null || echo "Ghostty already installed"

# Backup existing configs
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    echo "Backing up existing .zshrc to ~/.zshrc.backup"
    mv ~/.zshrc ~/.zshrc.backup
fi

# Create symlinks with Stow
echo "Creating symlinks..."
cd ~/.dotfiles
stow --adopt shell terminal

echo ""
echo "✓ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Open Ghostty (or restart your terminal)"
echo "2. Run 'source ~/.zshrc' to load new config"
echo "3. Enjoy your new terminal setup!"
echo ""
echo "To push to GitHub:"
echo "  cd ~/.dotfiles"
echo "  git add ."
echo "  git commit -m 'Initial dotfiles setup'"
echo "  git remote add origin https://github.com/samsun076/dotfiles.git"
echo "  git push -u origin main"

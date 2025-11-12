# Dotfiles

Minimal, portable terminal setup for macOS.

## What's Included

- **Shell**: Starship prompt with minimal config
- **Terminal**: Ghostty with Solarized Dark theme
- **Font**: JetBrains Mono Nerd Font

## Quick Install

On a new Mac:

```bash
# Clone the repo
git clone <your-repo-url> ~/.dotfiles

# Run install script
cd ~/.dotfiles
./install.sh
```

## Manual Setup

If you prefer manual installation:

```bash
# Install dependencies
brew install starship stow
brew install --cask font-jetbrains-mono-nerd-font ghostty

# Clone and symlink
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles
stow shell terminal
```

## What Gets Installed

- `~/.zshrc` → Basic zsh config with Starship
- `~/.config/starship.toml` → Minimal prompt config
- `~/.config/ghostty/config` → Terminal theme & font

## Customization

Edit configs in `~/.dotfiles/` and changes will reflect immediately (they're symlinked).

- **Prompt**: Edit `shell/.config/starship.toml`
- **Shell**: Edit `shell/.zshrc`
- **Terminal**: Edit `terminal/.config/ghostty/config`

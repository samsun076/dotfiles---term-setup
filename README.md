# Dotfiles

Minimal, portable terminal setup for macOS.

## What's Included

- **Shell**: Starship prompt with minimal config
- **Terminal**: Ghostty with Solarized Dark theme
- **Font**: JetBrains Mono Nerd Font
- **Tools**: lsd (colorful ls), glow (markdown viewer)

## Quick Install

On a new Mac:

```bash
# Clone the repo
git clone https://github.com/samsun076/dotfiles.git ~/.dotfiles

# Run install script
cd ~/.dotfiles
./install.sh
```

## Manual Setup

If you prefer manual installation:

```bash
# Install dependencies
brew install starship stow glow lsd
brew install --cask font-jetbrains-mono-nerd-font ghostty

# Clone and symlink
git clone https://github.com/samsun076/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow shell terminal
```

## What Gets Installed

- `~/.zshrc` → Basic zsh config with Starship, lsd aliases, glow
- `~/.config/starship.toml` → Minimal prompt config with git icons
- `~/.config/ghostty/config` → Terminal theme & font

## Included Aliases

- `ls` → lsd with icons and colors
- `ll` → lsd -lrth (time-sorted, newest at bottom)
- `la` → lsd -A (all files)
- `md` → glow (pretty markdown viewer)

## Customization

Edit configs in `~/.dotfiles/` and changes will reflect immediately (they're symlinked).

- **Prompt**: Edit `shell/.config/starship.toml`
- **Shell**: Edit `shell/.zshrc`
- **Terminal**: Edit `terminal/.config/ghostty/config`

## Auto-Sync

This repo includes an optional auto-sync feature that:
- Watches for config changes in the background
- Uses Claude Haiku to generate meaningful commit messages
- Shows an approval dialog before pushing
- Keeps all your machines in sync with useful git history

### Enable Auto-Sync

```bash
# Load the background service
launchctl load ~/Library/LaunchAgents/com.dotfiles.sync.plist

# Check status
launchctl list | grep dotfiles
```

### Disable Auto-Sync

```bash
launchctl unload ~/Library/LaunchAgents/com.dotfiles.sync.plist
```

### Manual Sync

You can also trigger a sync manually:

```bash
~/.dotfiles/scripts/dotfiles-sync.sh
```

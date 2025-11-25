#!/bin/bash
# dotfiles-sync.sh - Watch for dotfile changes and generate AI commit messages
set -e

# Ensure PATH includes npm-global for claude CLI
export PATH="$HOME/.npm-global/bin:/opt/homebrew/bin:$PATH"

DOTFILES_DIR="$HOME/.dotfiles"
PENDING_MSG="/tmp/dotfiles-pending-commit.txt"
LOG_FILE="/tmp/dotfiles-sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

cd "$DOTFILES_DIR"

# Check for uncommitted changes (staged or unstaged)
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    log "No changes detected"
    exit 0
fi

log "Changes detected, generating commit message..."

# Get the diff (including untracked files info)
DIFF=$(git diff)
UNTRACKED=$(git ls-files --others --exclude-standard)
if [ -n "$UNTRACKED" ]; then
    DIFF="$DIFF

Untracked files:
$UNTRACKED"
fi

# Generate commit message via Claude Haiku
MESSAGE=$(echo "$DIFF" | claude -p "Write a concise git commit message (1-2 lines) for these dotfile changes. Just the message, no quotes or explanation." --model haiku --max-turns 1 2>/dev/null)

if [ -z "$MESSAGE" ]; then
    log "Failed to generate commit message"
    exit 1
fi

log "Generated message: $MESSAGE"

# Save pending message for approval script
echo "$MESSAGE" > "$PENDING_MSG"

# Show modal dialog for approval
RESULT=$(osascript -e "display alert \"Dotfiles Changed\" message \"$MESSAGE\" buttons {\"Skip\", \"Push\"} default button \"Push\"" 2>/dev/null)

if echo "$RESULT" | grep -q "Push"; then
    log "User approved, running commit..."
    "$DOTFILES_DIR/scripts/dotfiles-approve.sh"
else
    log "User skipped commit"
fi

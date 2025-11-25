#!/bin/bash
# dotfiles-approve.sh - Commit and push dotfiles with the pending message
set -e

DOTFILES_DIR="$HOME/.dotfiles"
PENDING_MSG="/tmp/dotfiles-pending-commit.txt"
LOG_FILE="/tmp/dotfiles-sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

cd "$DOTFILES_DIR"

# Read the pending commit message
if [ ! -f "$PENDING_MSG" ]; then
    log "No pending commit message found"
    exit 1
fi

MESSAGE=$(cat "$PENDING_MSG")

if [ -z "$MESSAGE" ]; then
    log "Empty commit message"
    exit 1
fi

# Stage all changes
git add -A

# Commit with the generated message
git commit -m "$MESSAGE"

# Push to remote
git push

log "Successfully committed and pushed: $MESSAGE"

# Clean up
rm -f "$PENDING_MSG"

# Show success notification
osascript -e "display notification \"$MESSAGE\" with title \"Dotfiles Pushed\"" 2>/dev/null || true

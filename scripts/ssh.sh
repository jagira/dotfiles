#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"
SSH_DIR="$HOME/.ssh"
KEY="$SSH_DIR/id_ed25519"

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }
warn()    { echo "  [!] $*"; }

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Generate key if missing
if [[ -f "$KEY" ]]; then
  success "SSH key already exists at $KEY"
else
  info "Generating new SSH key..."
  ssh-keygen -t ed25519 -C "jagira@gmail.com" -f "$KEY"
  success "SSH key generated"
fi

# Start ssh-agent
eval "$(ssh-agent -s)" &>/dev/null
ssh-add "$KEY" 2>/dev/null || true

# Copy SSH config
SSH_CONFIG="$SSH_DIR/config"
DOTFILES_SSH_CONFIG="$DOTFILES/sshconfig"

if [[ ! -f "$DOTFILES_SSH_CONFIG" ]]; then
  warn "No sshconfig found in dotfiles — skipping SSH config copy"
else
  if [[ -f "$SSH_CONFIG" ]]; then
    success "SSH config already exists — skipping (diff manually if needed)"
  else
    cp "$DOTFILES_SSH_CONFIG" "$SSH_CONFIG"
    chmod 600 "$SSH_CONFIG"
    success "SSH config copied"
  fi
fi

# Copy public key to clipboard
if command -v pbcopy &>/dev/null && [[ -f "$KEY.pub" ]]; then
  pbcopy < "$KEY.pub"
  echo ""
  warn "Public key copied to clipboard — add it to GitHub: https://github.com/settings/keys"
fi

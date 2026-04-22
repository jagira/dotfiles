#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }

if command -v brew &>/dev/null; then
  success "Homebrew already installed"
else
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to PATH for Apple Silicon if needed
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  success "Homebrew installed"
fi

info "Turning off brew analytics..."
brew analytics off

info "Running brew bundle..."
brew bundle --file="$DOTFILES/Brewfile" --verbose

success "Homebrew packages installed"

# Reload brew environment so tools installed above (e.g. mise) are on PATH
eval "$(brew shellenv)"

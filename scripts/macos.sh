#!/usr/bin/env bash
set -euo pipefail

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }
warn()    { echo "  [!] $*"; }

# Xcode CLI tools
if xcode-select -p &>/dev/null; then
  success "Xcode CLI tools already installed"
else
  info "Installing Xcode CLI tools..."
  xcode-select --install
  warn "Xcode CLI install launched. Re-run this script after it completes."
  exit 1
fi

# Dummy xcode.app so Developer can be hidden from Spotlight
if [[ ! -e /Applications/xcode.app ]]; then
  info "Creating dummy xcode.app for Spotlight..."
  touch /Applications/xcode.app
  success "xcode.app created"
else
  success "xcode.app already exists"
fi

# Hostname
CURRENT_HOSTNAME=$(scutil --get HostName 2>/dev/null || echo "")
DESIRED_HOSTNAME="pirate"

if [[ "$CURRENT_HOSTNAME" == "$DESIRED_HOSTNAME" ]]; then
  success "Hostname already set to '$DESIRED_HOSTNAME'"
else
  info "Setting hostname to '$DESIRED_HOSTNAME'..."
  sudo scutil --set HostName "$DESIRED_HOSTNAME"
  success "Hostname set"
fi

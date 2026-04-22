#!/usr/bin/env bash
set -euo pipefail

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }
warn()    { echo "  [!] $*"; }

if ! command -v mise &>/dev/null; then
  warn "mise not found — skipping Ruby setup. Install via Brewfile first."
  exit 0
fi

info "Configuring mise for Ruby..."
mise settings ruby.compile=false
mise settings add idiomatic_version_file_enable_tools ruby
success "mise Ruby settings applied"

# Prompt for version
echo ""
read -rp "  Enter Ruby version to install (e.g. 3.3.4), or press Enter to skip: " RUBY_VERSION

if [[ -z "$RUBY_VERSION" ]]; then
  info "No version specified — installing latest Ruby..."
  mise use -g ruby
  success "Latest Ruby installed and set as global"
else
  CURRENT=$(mise list ruby 2>/dev/null | grep "$RUBY_VERSION" || true)
  if [[ -n "$CURRENT" ]]; then
    success "Ruby $RUBY_VERSION already installed via mise"
  else
    info "Installing Ruby $RUBY_VERSION via mise..."
    mise use -g "ruby@$RUBY_VERSION"
    success "Ruby $RUBY_VERSION installed and set as global"
  fi
fi

info "Setting bundler default CLI command to install..."
bundle config set default_cli_command install --global
success "Bundler default CLI command set"

#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }

# Usage: link_config <source_in_dotfiles> <target_path>
# Skips if symlink already points to the right place.
# Removes and relinks if target exists but is wrong/stale.
link_config() {
  local src="$DOTFILES/$1"
  local dst="$2"
  local dst_dir
  dst_dir="$(dirname "$dst")"

  mkdir -p "$dst_dir"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    success "Already linked: $dst"
    return
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    info "Removing existing: $dst"
    rm -rf "$dst"
  fi

  ln -s "$src" "$dst"
  success "Linked: $dst → $src"
}

mkdir -p ~/.config

link_config "zshrc"              "$HOME/.zshrc"
link_config "gitconfig"          "$HOME/.gitconfig"
link_config "ghostty/config"     "$HOME/.config/ghostty/config"
link_config "vimrc"              "$HOME/.vimrc"
link_config "zed/settings.json"  "$HOME/.config/zed/settings.json"
link_config "zed/keymap.json"    "$HOME/.config/zed/keymap.json"

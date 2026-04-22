#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"
SCRIPTS="$DOTFILES/scripts"

info()    { echo "  [·] $*"; }
success() { echo "  [✓] $*"; }
warn()    { echo "  [!] $*"; }

echo ""
echo "  dotfiles installer"
echo "  =================="
echo ""

run_script() {
  local name="$1"
  echo ""
  echo "── $name ──────────────────────────────────"
  bash "$SCRIPTS/$name.sh"
}

run_script "macos"
run_script "homebrew"
run_script "symlinks"
run_script "ruby"
run_script "ssh"

echo ""
echo "  All done. Open a new terminal to pick up changes."
echo ""

#!/usr/bin/env bash

# Auto Installation
set -e

# Load detection

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/pkg-detect.sh"

echo "Distro: $DISTRO"
echo "Package manager: $PKG_MANAGER"

if [ "$PKG_MANAGER" = "unknown" ]; then
    echo "Unsupported system"
    exit 1
fi

PACKAGES=(
    curl
    git
    vim
    tmux
    zsh
)

echo "Installing: ${PACKAGES[*]}"
$INSTALL_CMD "${PACKAGES[@]}"

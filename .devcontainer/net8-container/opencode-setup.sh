#!/usr/bin/env bash
set -e

echo "=== Initializing Devcontainer Environment ==="

# Verify or install OpenCode
if ! command -v opencode >/dev/null 2>&1; then
    echo "Installing OpenCode CLI..."
    ARCH="$(uname -m)"
    case "$ARCH" in
        x86_64) OPENCODE_ARCH="linux-x64" ;;
        aarch64|arm64) OPENCODE_ARCH="linux-arm64" ;;
        *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;;
    esac
    curl -fsSL "https://github.com/anomalyco/opencode/releases/latest/download/opencode-${OPENCODE_ARCH}.tar.gz" -o /tmp/opencode.tar.gz
    if [ "$(id -u)" -eq 0 ]; then
        tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin
        chmod +x /usr/local/bin/opencode
    else
        sudo tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin
        sudo chmod +x /usr/local/bin/opencode
    fi
    rm -f /tmp/opencode.tar.gz
fi

echo "OpenCode CLI is ready: $(opencode --version 2>/dev/null || echo 'installed')"
echo "Development environment setup complete."

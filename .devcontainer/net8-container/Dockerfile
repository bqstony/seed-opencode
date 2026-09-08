FROM mcr.microsoft.com/devcontainers/dotnet:8.0-bookworm

ARG USERNAME=vscode

# Install Node.js (v20 LTS) and tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
        git \
        zsh \
        sudo \
        procps \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install OpenCode binary
RUN ARCH="$(uname -m)" \
    && case "$ARCH" in \
        x86_64) OPENCODE_ARCH="linux-x64" ;; \
        aarch64|arm64) OPENCODE_ARCH="linux-arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;; \
    esac \
    && curl -fsSL "https://github.com/anomalyco/opencode/releases/latest/download/opencode-${OPENCODE_ARCH}.tar.gz" -o /tmp/opencode.tar.gz \
    && tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/opencode \
    && rm -f /tmp/opencode.tar.gz

# Configure Oh-My-Zsh plugins and theme for user vscode
USER ${USERNAME}
RUN git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions /home/${USERNAME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USERNAME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
    && sed -i 's/^plugins=(.*)/plugins=(git dotnet zsh-autosuggestions zsh-syntax-highlighting)/' /home/${USERNAME}/.zshrc \
    && sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' /home/${USERNAME}/.zshrc

USER ${USERNAME}

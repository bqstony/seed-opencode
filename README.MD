# How To

## Install Skills

- `npx skills@latest add mattpocock/skills` (Some skills of matt has dependency!)

## OpenCode Settings

- Global opencode config - `C:\Users\[username]\.config\opencode\opencode.jsonc`
- Global config folder agents - `C:\Users\[username]\.config\opencode\agents` (C:\Users\[username]\.config\opencode\agents\developer.md)

## OpenCode with LSB (Language Server Protocol)

> LSB is still in Beta, so we have to set the env

`$env:OPENCODE_EXPERIMENTAL_LSP_TOOL="true"; opencode`

For Configuration see: https://opencode.ai/docs/tools/#lsp-experimentell
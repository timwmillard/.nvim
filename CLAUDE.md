# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a comprehensive Neovim configuration repository using modern Lua-based setup with the Lazy plugin manager. The configuration is structured for development work with strong support for Go, Git workflows, LSP integration, and debugging.

## Architecture

### Core Structure
- `init.lua` - Main entry point with basic Vim settings, keymaps, and file type configurations
- `lua/lazy_init.lua` - Lazy plugin manager initialization
- `lua/plugins/` - Individual plugin configurations (one file per plugin/group)
- `lua/disabled/` - Disabled plugins that can be re-enabled
- `lua/plugins_todo/` - Plugin configurations under development
- `lua/secrets.lua` - Secure API key management via macOS keychain
- `after/plugin/` - Plugin-specific configurations loaded after plugins

### Plugin Management
Uses Lazy.nvim for plugin management with:
- Lazy loading based on commands, file types, and events
- Lock file (`lazy-lock.json`) for reproducible plugin versions
- Modular plugin configuration files in `lua/plugins/`

### Key Plugin Categories
1. **LSP & Completion**: lsp-zero.nvim, mason.nvim, nvim-cmp
2. **File Navigation**: telescope.nvim, oil.nvim, nvim-tree.lua
3. **Git Integration**: vim-fugitive, gitsigns.nvim, git-blame.nvim, diffview.nvim
4. **Debugging**: nvim-dap with Go support
5. **Development Tools**: go.nvim, rest.nvim, vim-dadbod-ui
6. **UI/UX**: catppuccin theme, lualine.nvim, trouble.nvim

## Common Development Commands

### Plugin Management
```bash
# Update all plugins
nvim -c "Lazy update"

# Install missing plugins
nvim -c "Lazy install"

# Check plugin status
nvim -c "Lazy"
```

### LSP Management
```bash
# Install/manage LSP servers
nvim -c "Mason"
```

## Key Keymaps and Shortcuts

### Leader Key
- Leader: `<Space>`
- Local Leader: `\`

### Essential Navigation
- `<leader>pp` - Find files (Telescope)
- `<leader>a` - Find all files including hidden
- `<leader>ff` - Live grep search
- `<leader>fb` - Buffer search
- `<leader>U` - Undo tree toggle

### Buffer Management
- `<leader>k` - Next buffer
- `<leader>j` - Previous buffer
- `<C-c>` - Close buffer

### Development Workflow
- `<leader>td` - Toggle LSP diagnostics
- `<leader>dd` - Refresh diagnostic config
- Oil.nvim for file management (configured in `lua/plugins/oil.lua`)

## Configuration Patterns

### Plugin Configuration
Each plugin has its own file in `lua/plugins/` following this pattern:
```lua
return {
    'plugin/name',
    dependencies = { 'other/plugin' },
    config = function()
        -- Plugin setup
    end
}
```

### Disabled Plugins
Plugins can be temporarily disabled by moving them to `lua/disabled/`. They maintain their configuration but won't load.

### Security
- API keys managed via macOS keychain in `lua/secrets.lua`
- No sensitive data committed to repository
- Environment variables set securely at runtime

## Development Focus Areas

This configuration is optimized for:
1. **Go Development** - Full LSP, debugging, and testing support
2. **Git Workflows** - Comprehensive Git integration and visualization
3. **Database Work** - vim-dadbod for SQL operations
4. **REST API Testing** - rest.nvim for HTTP requests
5. **File Navigation** - Multiple approaches (tree, fuzzy finder, oil)

## Dependencies

Required external tools:
- Neovim (latest stable)
- ripgrep - For telescope live grep
- Git - For version control integration
- Go toolchain - For Go development features
- Mason-managed LSP servers - Installed via `:Mason`

## Custom Features

1. **Secure API Key Management** - Uses macOS keychain for storing sensitive keys
2. **Comprehensive Go Support** - Debugging, testing, and development tools
3. **Multi-modal File Navigation** - Tree view, fuzzy finder, and oil-based editing
4. **Database Integration** - Built-in SQL client and management
5. **REST Client** - HTTP request testing within Neovim
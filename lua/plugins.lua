-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }

    -- File Search Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    vim.cmd.colorscheme "catppuccin"

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- vim.cmd('colorscheme rose-pine')

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-fugitive'

    -- Git Diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Git Signs
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- Syntax Highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- LSP Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- nvim dap
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use 'theHamsta/nvim-dap-virtual-text'

    -- postgres-nvim
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'guysherman/pg.nvim'
    -- use '~/dev/pg.nvim'


    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use 'ThePrimeagen/harpoon'
    use 'ThePrimeagen/vim-be-good'
end)

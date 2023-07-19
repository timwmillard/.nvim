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

    -- Treesitter playground
    use 'nvim-treesitter/playground'

    -- File Search Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    vim.cmd.colorscheme "catppuccin"


    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Git tools and wrapper
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

    -- Undo Tree
    use 'mbbill/undotree'

    -- nvim dap
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use 'theHamsta/nvim-dap-virtual-text'

    -- postgres-nvim
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'guysherman/pg.nvim'
    -- use '~/dev/pg.nvim'


    -- Alternative plugin
    -- https://vimawesome.com/plugin/pgsql
    -- https://github.com/lifepillar/pgsql.vim

    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use 'ThePrimeagen/harpoon'
    use 'ThePrimeagen/vim-be-good'


    -- Comment code lines
    -- 'gc' to comment
    -- 'gcc' to comment a line
    use 'tpope/vim-commentary'


    -- Go plugins
    use({
        'ray-x/go.nvim',
        requires = {
            'ray-x/guihua.lua', -- recommended if need floating window support
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        }
    })
    -- function signature hints
    use 'ray-x/lsp_signature.nvim'

    -- use({
    --     "jackMort/ChatGPT.nvim",
    --     config = function()
    --         require("chatgpt").setup({
    --             api_key_cmd = "pass show openai/api_key"
    --         })
    --     end,
    --     requires = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     }
    -- })


    use '~/dev/uuid.nvim'
end)

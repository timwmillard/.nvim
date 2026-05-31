return {
    -- {
    --     -- Undo Tree
    --     'mbbill/undotree',
    --     config = function()
    --         vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
    --     end
    -- },
    {
        'ThePrimeagen/vim-be-good'
    },
    {
        -- UUID generator
        'uuid.nvim',
        dir = '~/dev/uuid.nvim',
        config = function() require('uuid') end
    },
    -- {
    --     -- HTML snippets and shortcuts
    --     -- https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
    --     'mattn/emmet-vim'
    -- },
    {
        -- Hex view for binary files
        'RaafatTurki/hex.nvim',
        config = function() require('hex').setup() end
    },
    -- {
    --     'kwakzalver/duckytype.nvim',
    --     config = function()
    --         require('duckytype').setup({})
    --     end
    -- },
    -- {
    --     "ledger/vim-ledger",
    -- },
    -- {
    --     "AndrewRadev/linediff.vim"
    -- },
    {
        "nvzone/minty",
        dependencies = { "nvzone/volt", lazy = true },
        cmd = { "Shades", "Huefy" },
    },
    -- {
    --     "nvzone/showkeys",
    --     cmd = "ShowkeysToggle",
    --     opts = { position = "top-center" },
    -- },
    -- {
    --     "nvzone/typr",
    -- },
    -- {
    --     "jesses-code-adventures/bruno.nvim",
    --     -- Uses the pre-0.12 nvim-treesitter parser API.
    --     enabled = false,
    --     opts = {}
    -- },
    -- {
    --     "jesses-code-adventures/pipeline.nvim",
    --     config = function()
    --         require("pipeline").setup({
    --             exclude_organisations = {"microsoft", "google"} -- Exclude repos from these organizations
    --         })
    --
    --         vim.keymap.set('n', '<leader>pl', ':Pipeline open<CR>')
    --     end
    -- },
    {
        "chenasraf/text-transform.nvim",
        version = "*", -- or: tag = "stable"
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function() 
            require('text-transform').setup({
                -- custom settings
            })
        end,
    },
}

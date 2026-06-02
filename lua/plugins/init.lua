return {
    {
        'ThePrimeagen/vim-be-good'
    },
    {
        -- Hex view for binary files
        'RaafatTurki/hex.nvim',
        config = function() require('hex').setup() end
    },
    {
        "nvzone/minty",
        dependencies = { "nvzone/volt", lazy = true },
        cmd = { "Shades", "Huefy" },
    },
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
}

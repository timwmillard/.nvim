return {
    {
        -- Undo Tree
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
        end
    },
    {
        'ThePrimeagen/vim-be-good'
    },
    {
        -- UUID generator
        'uuid.nvim',
        dir = '~/dev/uuid.nvim',
        config = function() require('uuid') end
    },
    {
        -- HTML snippets and shortcuts
        -- https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
        'mattn/emmet-vim'
    },
    {
        -- Hex view for binary files
        'RaafatTurki/hex.nvim',
        config = function() require('hex').setup() end
    },
    {
        'kwakzalver/duckytype.nvim',
        config = function()
            require('duckytype').setup({})
        end
    },
    {
        "ledger/vim-ledger",
    },
    {
        "AndrewRadev/linediff.vim"
    },
}

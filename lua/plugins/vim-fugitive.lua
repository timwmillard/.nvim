return {
    { 'tpope/vim-rhubarb' },
    {
        'tpope/vim-fugitive',
        config = function()
            -- To get fugitive :GBrowse to work with nvim-tree
            -- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
            vim.api.nvim_create_user_command(
            'Browse',
            function (opts)
                vim.fn.system { 'open', opts.fargs[1] }
            end,
            { nargs = 1 }
            )

        end
    }
}


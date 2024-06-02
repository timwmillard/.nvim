return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup({
            gofmt = 'gofmt',
        })

        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require('go.format').goimports()
            end,
            group = format_sync_grp,
        })

        vim.keymap.set('n', '<leader>gofs', ':GoFillStruct<CR>')
        vim.keymap.set('n', '<leader>goat', ':GoAddTag<CR>')
        vim.keymap.set('n', '<leader>gort', ':GoRmTag<CR>')
        vim.keymap.set('n', '<leader>gott', ':GoTestFunc<CR>') -- Test Function
        vim.keymap.set('n', '<leader>gotf', ':GoTestFile<CR>') -- Test File
        vim.keymap.set('n', '<leader>gotp', ':GoTestPkg<CR>')  -- Test Package
        vim.keymap.set('n', '<leader>gota', ':GoTest<CR>')     -- Test All
        vim.keymap.set('n', '<leader>gorn', ':GoRename<CR>')
        vim.keymap.set('n', '<leader>goe', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>b')
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}

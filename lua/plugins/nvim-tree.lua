-- Nvim Tree
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            update_focused_file = {
                enable = true,
                update_root = false,
                ignore_list = {},
            },
            view = {
                width = 50,
            },
        })

        -- vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')
        -- vim.keymap.set('n', '<leader>b', ':NvimTreeFocus<CR>')

        vim.keymap.set('n', '<leader><tab>', ':NvimTreeToggle<CR>')

        require("nvim-web-devicons").set_icon {
            templ = {
                icon = "",
                color = "#e44d26",
                cterm_color = "196",
                name = "Templ"
            }
        }
    end

}

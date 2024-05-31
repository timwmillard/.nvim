return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
        }
    },
    {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    keys = {
        {
            "<localleader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
        },
        {
            "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
        }
    },
    config = function()
        require("rest-nvim").setup()
        -- first load extension
        require("telescope").load_extension("rest")
        -- then use it, you can also use the `:Telescope rest select_env` command
        vim.keymap.set('n', '<leader>se', function()
            require("telescope").extensions.rest.select_env()
        end, {})
    end,
    }
}


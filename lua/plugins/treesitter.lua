-- nvim-treesitter pinned to main (archived, used for query files only)
-- ts-install.nvim handles parser installation and management
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        init = function()
            vim.g.loaded_nvim_treesitter = 1
        end,
    },
    {
        "lewis6991/ts-install.nvim",
        config = function()
            require("ts-install").setup({
                auto_install = true,
                ensure_install = {
                    -- Go
                    "go", "gomod", "gosum",
                    -- Web
                    "javascript", "typescript",
                    -- Data
                    "yaml", "json", "sql",
                    -- Systems
                    "rust",
                    -- Note: c, lua, vim, vimdoc, markdown, markdown_inline, query
                    -- are bundled in Neovim 0.12 — no management needed
                },
            })
        end,
    },
}

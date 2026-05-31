-- Treesitter parser management (post nvim-treesitter archival)
--
-- Background: nvim-treesitter/nvim-treesitter was archived on 2026-04-03, five
-- days after Neovim 0.12 shipped. The maintainer rewrote it for 0.12 on a new
-- `main` branch; sustained user abuse over backward compat led to burnout.
--
-- Neovim 0.12 bundles 7 parsers natively (no management needed):
--   c, lua, vim, vimdoc, query, markdown, markdown_inline
--
-- For all other languages a parser manager is still required. Neovim's planned
-- replacement (nvim-treeconfig, issue #39006) is backlog with no ETA.
--
-- Setup:
--   - nvim-treesitter `main`: pinned as a read-only source of query files.
--     vim.g.loaded_nvim_treesitter = 1 prevents it running its own setup.
--   - ts-install.nvim (lewis6991): lightweight manager that installs parsers
--     from tree-sitter grammar repos. Requires tree-sitter CLI + C compiler.
--   - Highlighting is driven by vim.treesitter.start() in lua/treesitter.lua
--     via a FileType autocmd — the native 0.12 API, not nvim-treesitter's
--     highlight module.
--   - Mason is unrelated: it manages LSP servers/formatters, not TS parsers.
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

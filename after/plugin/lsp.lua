-- vim.diagnostic.config({
--     -- Disable underline, it's very annoying
--     underline = false,
--     -- Enable virtual text, override spacing to 4
--     virtual_text = { spacing = 4 },
--     signs = true,
--     update_in_insert = false,
-- })

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline, it's very annoying
        underline = false,
        -- Enable virtual text, override spacing to 4
        virtual_text = { spacing = 4 },
        signs = true,
        update_in_insert = false
    })

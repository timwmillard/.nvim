local on_attach = function(client, bufnr)
  -- Enable keybindings only for buffers with LSP attached
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- Go to definition with gd
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

  -- Other useful LSP keybindings
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completino') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        on_attach(client, ev.buf)

        -- -- Unset 'formatexpr'
        -- vim.bo[ev.buf].formatexpr = nil
        -- -- Unset 'omnifunc'
        -- vim.bo[ev.buf].omnifunc = nil
        -- -- Unmap K
        -- vim.keymap.del('n', 'K', { buffer = ev.buf })
    end
})

vim.diagnostic.config({ virtual_text = { current_line = true} })

vim.lsp.enable({
    'clangd',
    'gopls',
    'lua_ls',
})


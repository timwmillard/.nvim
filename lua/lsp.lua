local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, opts)
end

-- https://blog.viktomas.com/graph/neovim-native-built-in-lsp-autocomplete/
-- https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.completeopt = {'menuone', 'noselect', 'popup', 'fuzzy'}

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf,
                {
                    autotrigger = true,
                    convert = function(item)
                        return { abbr = item.label:gsub("%b()", "") }
                    end,
                }
            )
        end

        vim.keymap.set("i", "<C-space>", vim.lsp.completion.get,
            { desc = "trigger autocompletion" }
        )
        on_attach(client, ev.buf)

        vim.lsp.inlay_hint.enable(false, { bufnr = ev.buf })
        if client then
            client.server_capabilities.inlayHintProvider = nil
        end
    end
})


vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})

vim.diagnostic.config({ virtual_text = { current_line = true} })

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config('elixir-ls', {
  cmd = { '/Users/tim/.local/share/nvim/mason/packages/elixir-ls/language_server.sh' },
  filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  root_markers = { 'mix.exs', '.git' },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = true,
      enableTestLenses = true,
      suggestSpecs = true,
      signatureAfterComplete = false,
    }
  },
  -- on_attach = on_attach,
})

vim.lsp.enable({
    'clangd',
    'gopls',
    'lua_ls',
    'elixir-ls',
})

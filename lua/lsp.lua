local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, opts)

    if client and client.supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
            convert = function(item)
                return { abbr = item.label:gsub("%b()", "") }
            end,
        })
    end
end

-- https://blog.viktomas.com/graph/neovim-native-built-in-lsp-autocomplete/
-- https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.completeopt = {'menuone', 'noselect', 'popup', 'fuzzy'}


vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})

vim.diagnostic.config({ virtual_text = { current_line = true} })

vim.lsp.config('elixirls', {
  cmd = { '/Users/tim/.local/share/nvim/mason/packages/elixir-ls/language_server.sh' },
  filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  root_markers = { 'mix.exs', '.git' },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = true,
      enableTestLenses = true,
      suggestSpecs = true,
    }
  },
  on_attach = on_attach,
})

vim.lsp.config.clangd = {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
    },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
    on_attach = on_attach,
}
vim.lsp.enable({
    'clangd',
    'gopls',
    'lua_ls',
    'elixirls',
})

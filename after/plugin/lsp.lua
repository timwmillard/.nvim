local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require('lspconfig')

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())


local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
    }
})

lspconfig.clangd.setup {
}

-- show errors in window
vim.keymap.set('n', '<leader>e', function()
    vim.diagnostic.open_float(0, { scope = "line" })
end, {})

vim.keymap.set('n', '<leader>fd', function()
    vim.lsp.buf.format()
end, {})


vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)


-- Postgres LSP
require('lspconfig.configs').postgres_lsp = {
  default_config = {
    name = 'postgres_lsp',
    cmd = {'postgres_lsp'},
    filetypes = {'sql'},
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern 'root-file.txt'
  }
}

lsp.configure("postgres_lsp", {force_setup = true})

lsp.setup()
